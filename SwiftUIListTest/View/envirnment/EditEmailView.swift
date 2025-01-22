//
//  EditEmailView.swift
//  SwiftUIListTest
//
//  Created by Masud  Parvez on 30/5/24.
//

import SwiftUI

struct EditEmailView: View {
    
    @State private var email = ""
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var viewModel : ContentViewModel
    
    var body: some View {
        VStack {
            TextField("Enter Email Address", text: $email)
                .font(.title3)
                .padding()
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .background(.white)
                .cornerRadius(50)
                .shadow(color: Color.black.opacity(0.08), radius: 60, x: 0 , y: 20)
            
            Button("Ok Press", action: {
                viewModel.user.email = email
                dismiss()
            })
            
            Divider()
            Spacer()
            
        }
        
    }
}



struct EditAddressView : View {
    
    @StateObject var viewModel: ContentViewModel

    @State private var address : String = ""
    @Environment(\.dismiss) var dismiss

    
    var body: some View {
        VStack{
            TextField("Edit your address", text: $address)
                .font(.title3)
                .padding()
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .background(.white)
                .cornerRadius(20)
                .shadow(color: Color.black.opacity(0.08), radius: 60, x: 0 , y: 20)
            
            TextField("Edit your address", text: $address)
                .frame(height: 50)
                .textFieldStyle(.automatic)
                .cornerRadius(16)
                .padding(.horizontal , 4)
                .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.gray))
                .padding(.horizontal , 10)
            
            Spacer()
        }
        .navigationTitle("Edit Address")
        .padding()
        .toolbar {
            ToolbarItem(placement: .topBarTrailing, content: {
                Button("Done", action: {
                    viewModel.user.address = self.address
                    debugPrint("\(self.address)")
                    dismiss()
                }).fontWeight(.semibold)
            })
        }
    }
}


#Preview {
    EditAddressView(viewModel: ContentViewModel())
}
