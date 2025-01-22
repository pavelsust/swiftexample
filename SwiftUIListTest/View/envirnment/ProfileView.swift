//
//  ProfileView.swift
//  SwiftUIListTest
//
//  Created by Masud  Parvez on 29/5/24.
//

import SwiftUI


struct ProfileView: View {
    
    @StateObject var viewModel = ContentViewModel()
    
    var body: some View {
        
        NavigationStack{
            List{
                NavigationLink{
                    EditAddressView(viewModel: viewModel)
                }label: {
                    HStack{
                        Text("JD")
                            .font(.headline)
                            .foregroundStyle(.white)
                            .frame(width: 48 , height: 48)
                            .background(Color(.systemGray4))
                            .clipShape(.circle)
                        
                        VStack(alignment: .leading,content: {
                            
                            Text(viewModel.user.fullName)
                                .font(.subheadline)
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            
                            Text(viewModel.user.email)
                                .font(.footnote)
                                .fontWeight(.bold)
                                .padding(.leading , 2)
                                .foregroundColor(.gray)
                            
                            Text(viewModel.user.address)
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

#Preview {
    ProfileView()
}
