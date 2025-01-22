//
//  LoginScreen.swift
//  SwiftUIListTest
//
//  Created by Masud  Parvez on 22/8/24.
//

import SwiftUI


struct LoginScreen: View {
    
    
    @State var editName : String = ""
    @State var editPassword: String = ""
    
    @State var isCover : Bool = false
    
    @State var navigationPath : [Route] = []
    
    var body: some View {
        
        NavigationStack(path: $navigationPath){
            ScrollView{
                VStack{
                    Text("Login Here")
                        .font(.title2)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .padding()
                    
                    Image("avengers")
                        .resizable()
                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                        .clipped()
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.accentColor , lineWidth: 2)
                        )
                        .padding(.trailing , 10)
                        .padding(.leading , 10)
                        .padding(.top , 20)
                    
                    
                    Spacer(minLength: 120)
                    
                    CustomFieldView(iconName: "person", hintsText: "Enter Your Email",textField: $editName, isSecure: false)
                        .padding(.leading , 10)
                        .padding(.trailing , 10)
                    
                    CustomFieldView(iconName: "lock", hintsText: "Enter Your Email",textField: $editPassword, isSecure: true)
                        .padding(.leading , 10)
                        .padding(.trailing , 10)
                        .padding(.top , 10)
                    
                    Button(action: {
                        navigationPath.append(.Home)
                    }, label: {
                        Text("Login")
                            .font(.system(.body , design: .rounded))
                            .foregroundColor(.white)
                            .bold()
                            .padding()
                            .frame(minWidth: 0 , maxWidth: .infinity)
                            .background(Color.accentColor)
                            .cornerRadius(12)
                            .padding()
                        
                    })
                    
                    NavigationLink(destination: ProfileView(), label:{
                        Text("Working on it")
                    })
                }
                
            }
        }.navigationDestination(for: Route.self){ item in
            switch item {
            case .Home:
                Text("Hello")
                NavDetailsScreen(navigationPath: $navigationPath)
            case .Login:
                NavDetailsScreen(navigationPath: $navigationPath)
            case .Details:
                NavDetailsScreen(navigationPath: $navigationPath)
            case .ListScreen:
                NavDetailsScreen(navigationPath: $navigationPath)
                
            }
            
        }
    }
    
}


struct NavDetailsScreen : View{
    
    @Binding var navigationPath : [Route]
    
    var body: some View{
        Text("Welcome Second Screen")
    }
}

enum Route{
    case Login, Home, Details, ListScreen
}


#Preview {
    LoginScreen()
}



//
//
//enum Route {
//    case view2
//    case view3
//}
//
//struct View1: View {
//    @State private var navigationPath: [Route] = []
//    
//    var body: some View {
//        NavigationStack(path: $navigationPath) {
//            Button("Go to view 2") {
//                navigationPath.append(.view2)
//            }
//            .background(Color.red)
//            .navigationDestination(for: Route.self) { route in
//                switch route {
//                case .view2:
//                    View2(navigationPath: $navigationPath)
//                case .view3:
//                    View3(navigationPath: $navigationPath)
//                }
//            }
//        }
//    }
//}
//
//struct View2: View {
//    @Binding var navigationPath: [Route]
//    
//    var body: some View {
//        Button("Go to view 3") {
//            navigationPath.append(.view3)
//        }
//        .background(Color.orange)
//    }
//}
//
//struct View3: View {
//    @Environment(\.dismiss) private var dismiss
//    @Binding var navigationPath: [Route]
//    
//    var body: some View {
//        Button("Pop view") {
//            //navigationPath.removeLast()
//            
//            // or - call `dismiss()`
//            // dismiss()
//            dismiss()
//        }
//        .background(Color.green)
//    }
//}

