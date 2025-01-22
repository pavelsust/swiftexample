//
//  extension.swift
//  SwiftUIListTest
//
//  Created by Masud  Parvez on 15/9/24.
//

//import Combine
//import Foundation
//
//extension Publishers {
//    
//    struct TimeBasedPolling<Upstream, Publisher> : Publisher {
//        
//        typealias Output = [Upstream.Output]
//        typealias Failure = Upstream.Failure
//        
//        
//        private let upstream : Upstream
//        private let interval : TimeInterval
//        
//        init(upstream: Upstream, interval: TimeInterval) {
//            self.upstream = upstream
//            self.interval = interval
//        }
//        
//        func receive<S>(subscriber: S) where S: Subscriber, Failure == S.Failure, Output == S.Input {
//                   upstream
//                       .collect(.byTime(DispatchQueue.main, .seconds(interval)))
//                       .receive(subscriber: subscriber)
//               }
//    }
//}
//
//extension Publisher {
//    func polling(for interval: TimeInterval) -> Publishers.TimeBasedPolling<Self> {
//        return Publishers.TimeBasedPolling(upstream: self, interval: interval)
//    }
//}


import SwiftUI
import Combine
import Foundation

extension Publishers {
    struct TimeBasedPolling<Upstream : Publisher> : Publisher {
        typealias Output = [Upstream.Output]
        typealias Failure = Upstream.Failure
        
        private let upstream : Upstream
        private let interval : TimeInterval
        
        init(upstream: Upstream, interval: TimeInterval) {
            self.upstream = upstream
            self.interval = interval
        }
        
        func receive<S>(subscriber: S) where S : Subscriber, Upstream.Failure == S.Failure, [Upstream.Output] == S.Input {
            upstream
                .collect(.byTime(DispatchQueue.main, .seconds(interval)))
                .receive(subscriber: subscriber)
        }
    }
}


extension Publisher {
    func polling(for interval : TimeInterval) -> Publishers.TimeBasedPolling<Self>{
        return Publishers.TimeBasedPolling(upstream: self, interval: interval)
    }
}


class StockViewModel: ObservableObject {
    @Published var latestAnalysis: Stock?
    private var cancellables = Set<AnyCancellable>()

    init(stockPublisher: AnyPublisher<Stock, Never>) {
        stockPublisher
            .polling(for: 1) // Polling stocks every 5 seconds
            .sink { [weak self] analysis in
                self?.latestAnalysis = Stock(price: (0..<1000).randomElement()!)
            }
            .store(in: &cancellables)
    }
}

struct Stock {
    let price: Int
}

