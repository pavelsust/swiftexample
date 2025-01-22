//
//  DetailsView.swift
//  SwiftUIListTest
//
//  Created by Masud  Parvez on 14/1/24.
//

import SwiftUI

struct DetailsView: View {
    

    var body: some View{
        ScrollView{
            CircleImage()
                .offset(y: 20)
                .frame(width: 250, height: 250)
            
            VStack(alignment: .leading){
                Text("Land Mark Name")
                    .font(.title)
                
                HStack{
                    Text("Landmark Park")
                    Spacer()
                    Text("Landmark State")
                }.font(.subheadline)
                    .foregroundStyle(.secondary)
                
                Divider()
                
                Text("About Land Mark")
                    .font(.title2)
                
                Text("Landmark Description")
                    .font(.system(size: 18))
                
            }.padding()
                .navigationTitle("Landmark Name")
            
            Divider()
            
            VStack(alignment: .leading){
                
                Text("About Turtle Rock")
                    .font(.title2)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                
                Text("Descriptive text goes here.")
                    .font(.title2)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            }
            .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
        }
        .navigationTitle("Landmark Name")
        .navigationBarTitleDisplayMode(.inline)
    }
    
}

#Preview {
    DetailsView()
}
