//
//  DoCatchTryThrowsBootcamp.swift
//  SwiftUIListTest
//
//  Created by Masud  Parvez on 17/9/24.
//

import SwiftUI



// do catch
// try
// throws


class DocatchTryThrowBootcampDataManager{
    
    var isActive : Bool = true
    
    func getTitle() -> (title : String? , error : Error?) {
        if isActive {
            return ("New Text", nil)
        }else{
            return (nil , URLError(.badURL))
        }
    }
    
    
    func getTitle2() -> Result<String , Error>{
        if isActive {
            return .success("New Text")
        } else{
            return .failure(URLError(.badURL))
        }
    }
    
    
    func getTitle3() throws -> String{
//        if isActive {
//            return "Return from Title3"
//        }else{
//            throw URLError(.badURL)
//        }
        throw URLError(.badURL)
    }
    
    func getTitle4() throws -> String{
        if isActive {
            return "Final Title"
        }else{
            throw URLError(.badURL)
        }
    }
    
    
    func getTitle6() throws -> String {
        if isActive {
            return "Final 5"
        }else{
            throw URLError(.badURL)
        }
    }
    
}

class DocatchTryThrowBootcampViewModel : ObservableObject{
    
    @Published var text : String = "Starting Text"
    var manager = DocatchTryThrowBootcampDataManager()
    
    /*
    func fetchTitle(){
        switch manager.getTitle2() {
        case .success(let newTitle):
            self.text = newTitle
        case .failure(let failure):
            self.text = failure.localizedDescription
        }
    }
     */
    
   // let newTitle = try manager.getTitle3()
    
    
//    func fetchTitle(){
//        do {
//            let newTitle = try manager.getTitle3()
//            self.text = newTitle
//        } catch let error {
//            self.text = error.localizedDescription
//        }
//    }
    
    
    func fetchTitle(){
        do {
            let finalTitle = try manager.getTitle4()
            self.text = finalTitle
            
            let newTitle = try? manager.getTitle3()
            if let newTitle = newTitle {
                self.text = newTitle
            }
        } catch let error{
            self.text = error.localizedDescription
        }
    }
    
    
    func fetchFinalTitle(){
        
        do{
            let newTitle = try manager.getTitle6()
            self.text = newTitle
        }catch let error{
            self.text = error.localizedDescription
        }
    }
    
}

struct DoCatchTryThrowsBootcamp: View {
    
    @StateObject private var viewModel = DocatchTryThrowBootcampViewModel()
    
    var body: some View {
        Text("\(viewModel.text)")
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .frame(width: 300 , height: 300)
            .background(Color.blue)
            .onTapGesture {
                viewModel.fetchTitle()
            }
    }
}

#Preview {
    DoCatchTryThrowsBootcamp()
}
