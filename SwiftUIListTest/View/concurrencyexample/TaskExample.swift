//
//  TaskExample.swift
//  SwiftUIListTest
//
//  Created by Masud  Parvez on 20/1/25.
//

import SwiftUI




class TaskBootcampViewModel : ObservableObject {
    @Published var image : UIImage? = nil
    @Published var image2 : UIImage? = nil
    
    func fetchImage() async throws{
        guard let url = URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRmCy16nhIbV3pI1qLYHMJKwbH2458oiC9EmA&s") else {return}
        
        let (data, _) = try await URLSession.shared.data(from: url)
        return self.image = UIImage(data: data)
    }
    
    func fetchImage2() async throws{
        guard let url = URL(string: "https://images.pexels.com/photos/414612/pexels-photo-414612.jpeg?cs=srgb&dl=pexels-souvenirpixels-414612.jpg&fm=jpg") else {return}
        
        let (data, _) = try await URLSession.shared.data(from: url)
        return self.image2 = UIImage(data: data)
    }
}


struct TaskExample: View {
    
    @StateObject var viewModel = TaskBootcampViewModel()
    @State var isRefresh : Bool = false
    @State var imageTask : Task<(), Never>? = nil
    
    
    var body: some View {
        VStack(alignment: .center){
            
//            if let image = viewModel.image{
//                Image(uiImage: image)
//            }else {
//                ProfileView().padding()
//            }
            
            Image(uiImage: (viewModel.image ?? UIImage(systemName: "heart.fill"))!)
            Image(uiImage: (viewModel.image2 ?? UIImage(systemName: "heart.fill"))!)
                .resizable()
                .frame(width: 300 , height: 300)
            
            Button("OK"){
                self.isRefresh.toggle()
            }
            
        }
        
        .task(id: isRefresh,priority: .background){
            try? await viewModel.fetchImage()
            try? await viewModel.fetchImage2()
        }
        .task {
            imageTask = Task(priority: .background){
                try? await viewModel.fetchImage()
                try? await viewModel.fetchImage2()
            }
        }
        .task {
            async let fetchImage1 = viewModel.fetchImage()
            async let fetchImage2 = viewModel.fetchImage2()
            
            let (image1 , image2) = await (try? fetchImage1 , try? fetchImage2)
        }
        .onDisappear{
            imageTask?.cancel()
        }
        
    }
}

#Preview {
    TaskExample()
}
