//
//  FeatureCardExample.swift
//  SwiftUIListTest
//
//  Created by Masud  Parvez on 20/3/24.
//

import SwiftUI

struct FeatureCardExample: View {
    var body: some View {
        VStack{
            Image("hiddenlake")
                .resizable()
                .overlay{
                    TextOverlay(title: "Hello World", description: "Welcome to the hell")
                }
                .frame(width: .infinity , height: 230)
        }
    }
}



struct TextOverlay : View{
    var title : String
    var description: String
    
    var gradient: LinearGradient{
        .linearGradient(Gradient(colors: [.black.opacity(0.6) , .black.opacity(0)]), startPoint: .bottom, endPoint: .center)
    }
    
    var body: some View{
        
        ZStack(alignment: .bottomLeading){
            gradient
            VStack(alignment: .leading){
                Text(title)
                    .font(.title)
                    .bold()
                Text(description)
            }.padding()
        }.foregroundStyle(.white)
    }
}

#Preview {
    //TextOverlay(title: "Hello World", description: "Welcome to the hell")
    FeatureCardExample()
}
