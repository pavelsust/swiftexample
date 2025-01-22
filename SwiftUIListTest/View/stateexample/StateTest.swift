//
//  StateTest.swift
//  SwiftUIListTest
//
//  Created by Masud  Parvez on 16/3/24.
//

import SwiftUI

struct StateTest: View {
    
    
    @State private var backGroundColor: Color = Color.red
    @State private var title:String = "Simple Title"
    
    
    var body: some View {
        ZStack{
            backGroundColor
            VStack{
                Text(title)
                StateColorTest(backGroundColor: $backGroundColor, title: $title)
            }
        }
    }
}



struct StateColorTest: View {
    
    @Binding var backGroundColor: Color
    @Binding var title : String
    
    var body: some View {
        VStack{
            Button(action: {
                backGroundColor = Color.gray
                title = "Halar vai title"
            }, label: {
                Text("Normal Button")
            })
        }
    }
}


#Preview {
    StateTest()
}
