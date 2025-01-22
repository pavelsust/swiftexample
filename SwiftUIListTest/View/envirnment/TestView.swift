//
//  TestView.swift
//  SwiftUIListTest
//
//  Created by Masud  Parvez on 2/6/24.
//

import SwiftUI



struct TestView: View {
    
    @EnvironmentObject var viewModel : MainInfoData
    
    var body: some View {
        NavigationStack{
            List{
                NavigationLink{
                    TestViewName()
                }label: {
                    HStack{
                        Text("JD")
                            .font(.headline)
                            .foregroundStyle(.white)
                            .frame(width: 48 , height: 48)
                            .background(Color(.systemGray4))
                            .clipShape(.circle)
                        
                        VStack(alignment: .leading,content: {
                            
                            Text(viewModel.infoData.name)
                                .font(.subheadline)
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            
                            Text(viewModel.infoData.email)
                                .font(.footnote)
                                .fontWeight(.bold)
                                .padding(.leading , 2)
                                .foregroundColor(.gray)
                            
                            Text(viewModel.infoData.address)
                                .font(.footnote)
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .foregroundStyle(.gray)
                                .padding(.leading, 2)
                        })
                    }
                }
            }
        }
    }
}


struct TestViewName : View {
    
    @EnvironmentObject var viewModel : MainInfoData
    
    var body: some View {
        NavigationStack{
            NavigationLink{
                ViewName()
            }label: {
                Text("Name is \(viewModel.infoData.name)")
            }
        }
    }
}

#Preview {
    TestView()
}
