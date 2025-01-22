//
//  ZSStateExample.swift
//  SwiftUIListTest
//
//  Created by Masud  Parvez on 13/2/24.
//

import SwiftUI

struct ZSStateExample: View {
    var body: some View {
        ZStack(alignment: .top){
            Color.yellow
            Text("Hello wordl")
        }.frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
            .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}

#Preview {
    ZSStateExample()
}
