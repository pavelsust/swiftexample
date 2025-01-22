//
//  ViewName.swift
//  SwiftUIListTest
//
//  Created by Masud  Parvez on 2/6/24.
//

import SwiftUI


struct ViewName : View {
    
    @State var name : String = ""
    @EnvironmentObject var viewModel : MainInfoData
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        TextField("Enter Name", text: $name)
            .font(.title3)
            .padding()
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            .background(.white)
            .cornerRadius(50)
            .shadow(color: Color.black.opacity(0.08), radius: 60, x: 0 , y: 20)
        
        Button("Press Ok", action: {
            self.viewModel.infoData.name = "\(name)"
            dismiss()
        })
    }
}
