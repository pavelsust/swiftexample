//
//  TestSub.swift
//  SwiftUIListTest
//
//  Created by Masud  Parvez on 16/9/24.
//

import SwiftUI
import Combine


struct TestSub: View {
    @StateObject private var viewModel: StockViewModel

    init() {
            // Use a real continuous publisher. Replace this with your stock data source.
            let stockPublisher = Just(Stock(price: Int.random(in: 0..<1000)))
                .append(Just(Stock(price: Int.random(in: 0..<1000)))) // Simulate continuous stock updates
                .eraseToAnyPublisher()

            // Initialize the viewModel with the custom polling mechanism
            _viewModel = StateObject(wrappedValue: StockViewModel(stockPublisher: stockPublisher))
        }


    var body: some View {
        VStack {
            if let latestAnalysis = viewModel.latestAnalysis {
                Text("Latest Stock Price: \(latestAnalysis.price)")
                    .font(.largeTitle)
                    .padding()
            } else {
                Text("Fetching stock data...")
                    .font(.title)
            }
        }
    }
}

#Preview {
    TestSub()
}

