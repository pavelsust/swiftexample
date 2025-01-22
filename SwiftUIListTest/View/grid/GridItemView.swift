//
//  GridItemView.swift
//  SwiftUIListTest
//
//  Created by Masud  Parvez on 31/3/24.
//

import SwiftUI

struct GridItemView: View {
    
    
    private let adaptiveColumn = [GridItem(.adaptive(minimum: 140))]
    
    var body: some View{
        
        ScrollView{
            LazyVGrid(columns: adaptiveColumn, spacing: 10, content: {
                ForEach(1...100 , id: \.self){item in
                showTitleList(title: "\(item)")
                }
            }).padding()
                .edgesIgnoringSafeArea(.top)
        }
    }
}

#Preview {
    GridItemView()
}




@ViewBuilder
func showTitleList(title:String) -> some View {
    ZStack{
        RoundedRectangle(cornerRadius: 5)
            .foregroundColor(.yellow)
           
        Text(title)
            .font(.system(size: 15))
            .foregroundStyle(.blue)
            .padding()
    }
    .frame(width: .infinity, height: 180)
}


struct Information{
    var title:String
}
