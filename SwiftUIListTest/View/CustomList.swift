//
//  CustomList.swift
//  SwiftUIListTest
//
//  Created by Masud  Parvez on 15/1/24.
//

import SwiftUI

struct CustomList: View {
    
    var animal: Animal
    let contentClick : (String) -> Void
    
    var body: some View {
        CardView{
            HStack{
                Image("hiddenlake")
                    .resizable()
                    .frame(width: 40, height: 50)
                
                Text(animal.title)
                    .font(.headline)
                    .foregroundColor(.black)
                
                Text("Nothing")
                    .makeCustomTitle()
                
                Spacer()
                
                if animal.isFavourite{
                    Image(systemName: "star.fill")
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                }else{
                    Image(systemName: "star.fill")
                        .foregroundColor(.gray)
                }
                
            }
                .padding()
                .onTapGesture(perform: {
                    contentClick(animal.title)
                })
        }
        .frame(width: .infinity, height: 70)
        .shadow(radius: 5)
        .background(.white)
        .foregroundColor(.white)
        .padding(.leading , 10)
        .padding(.trailing , 10)
    }
}

#Preview {
    //CustomList(animal: Animal(id: 100, title: "Animal Name", isFavourite: true))
    CustomList(animal: Animal(id: 100, title: "Animal Name", isFavourite: true), contentClick: { value in
        print("Hello World")
    })
}
