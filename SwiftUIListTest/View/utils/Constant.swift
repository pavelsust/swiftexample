//
//  Constant.swift
//  SwiftUIListTest
//
//  Created by Masud  Parvez on 27/5/24.
//

import Foundation
import SwiftUI


class Constant {
    
    static let API_TOKEN :String = "api_token"
}


struct PrimaryLabel : ViewModifier {
    func body(content : Content) -> some View{
        content
            .padding()
            .background(Color.black)
            .font(.largeTitle)
            .cornerRadius(10)
    }
}

struct CustomTitle : ViewModifier {
    func body(content: Content) -> some View {
        content.font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            .font(.footnote)
    }
}

struct CustomModel : ViewModifier{
    func body(content: Content) -> some View {
        content
            .font(.title)
            .background()
            .foregroundColor(.red)
    }
}

struct CustomSeeMoreTitle: ViewModifier{
    func body(content: Content) -> some View {
        content
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
    }
}

extension View {
    func makePrimaryLabel() -> some View{
        ModifiedContent(content: self, modifier: PrimaryLabel())
    }
    
    func makeCustomTitle() -> some View{
        ModifiedContent(content: self, modifier: CustomTitle())
    }
    
    func customSeeMore() -> some View {
        ModifiedContent(content: self, modifier: CustomSeeMoreTitle())
    }
    
    func customModel() -> some View{
        ModifiedContent(content: self, modifier: CustomModel())
    }
}
