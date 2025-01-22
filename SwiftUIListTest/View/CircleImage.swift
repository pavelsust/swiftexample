//
//  CircleImage.swift
//  SwiftUIListTest
//
//  Created by Masud  Parvez on 17/1/24.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("hiddenlake")
            .resizable()
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .overlay{
                Circle().stroke(Color.white, lineWidth: 4)
            }.shadow(radius: 7)
    }
}

#Preview {
    CircleImage()
}
