//
//  EdittextView.swift
//  SwiftUIListTest
//
//  Created by Masud  Parvez on 18/3/24.
//

import SwiftUI

struct EdittextView: View {
    
    @State private var userName: String = ""
    
    
    var body: some View {
        VStack{
            
            Text("\(userName)")
            
            TextField("Hello World", text: $userName)
                .padding(.leading , 10)
                .padding(.trailing , 10)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button(action: {
                userName = "Pavel"
            }, label: {
                Text("Done")
            })
        }
        .padding(15)
    }
}

#Preview {
    EdittextView()
}
