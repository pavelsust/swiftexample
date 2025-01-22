//
//  ProfileEditView.swift
//  SwiftUIListTest
//
//  Created by Masud  Parvez on 29/5/24.
//

import SwiftUI
import AlertToast

struct ProfileEditView: View {
    
    @ObservedObject var viewModel : ContentViewModel
    
    var body: some View {
        NavigationStack{
            List{
                Section("Edit Options"){
                    Text("\(viewModel.user.fullName)")
                    
                    NavigationLink{
                        EditEmailView(viewModel: viewModel)
                    }label: {
                        Text("\(viewModel.user.email)")
                    }
                    
                    
                    NavigationLink{
                        EditAddressView(viewModel: viewModel)
                    } label: {
                        Text("\(viewModel.user.address)")
                    }
                }
            }
        }
    }
}
