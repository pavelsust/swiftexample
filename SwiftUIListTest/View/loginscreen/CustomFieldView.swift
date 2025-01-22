//
//  CustomFieldView.swift
//  SwiftUIListTest
//
//  Created by Masud  Parvez on 22/8/24.
//

import SwiftUI

struct CustomFieldView: View {
    
    
    var iconName : String = ""
    var hintsText : String = ""
    @Binding var textField : String
    var isSecure : Bool = false
    
    
    var body: some View {
        VStack{
            HStack{
                Image(systemName: iconName)
                    .foregroundColor(.accentColor)
                
                if isSecure {
                    SecureField(hintsText , text: $textField)
                } else {
                    TextField(hintsText , text: $textField)
                }
            }
            .padding()
            .overlay{
                RoundedRectangle(cornerRadius: 10)
                    .stroke(
                        Color.accentColor,
                        lineWidth: 1
                    )
            }
        }
    }
}

#Preview {
    CustomFieldView (iconName: "person", hintsText: "hints", textField: .constant("Obada.semary"), isSecure: false)
}
