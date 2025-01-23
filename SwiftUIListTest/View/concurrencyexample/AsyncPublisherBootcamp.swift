//
//  AsyncPublisherBootcamp.swift
//  SwiftUIListTest
//
//  Created by Masud  Parvez on 23/1/25.
//

import SwiftUI
import Combine


class AsyncPublisherDatamanager {
    @Published var myData : [String] = []
    
    func addData() async {
        myData.append("Apple")
        try? await Task.sleep(nanoseconds: 2_000_000_000)
        myData.append("Banana")
        try? await Task.sleep(nanoseconds: 2_000_000_000)
        myData.append("Orange")
        try? await Task.sleep(nanoseconds: 2_000_000_000)
        myData.append("Watermelon")
    }
}


class AsyncPublisherBootcampViewModel : ObservableObject {
    @Published var dataArray : [String] = []
    let manager = AsyncPublisherDatamanager()
    var cancellables = Set<AnyCancellable>()
    
    
    init() {
        addSubscribers()
    }
    
    private func addSubscribers(){
        manager.$myData.receive(on: DispatchQueue.main , options: nil)
            .sink{ data in
                self.dataArray = data
            }
            .store(in: &cancellables)
    }
    
    func start() async {
        await manager.addData()
    }
}

struct AsyncPublisherBootcamp: View {
    
    @StateObject private var viewModel = AsyncPublisherBootcampViewModel()
    
    var body: some View {
        ScrollView {
            VStack{
                ForEach(viewModel.dataArray , id: \.self){ item in
                    Text("\(item)")
                }
            }.task {
                await viewModel.start()
            }
        }
    }
}

#Preview {
    AsyncPublisherBootcamp()
}
