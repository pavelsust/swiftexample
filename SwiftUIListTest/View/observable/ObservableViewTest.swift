//
//  ObservableViewTest.swift
//  SwiftUIListTest
//
//  Created by Masud  Parvez on 18/3/24.
//

import SwiftUI

struct ObservableViewTest: View {
    
    @State var randomNumber: Int = 0
    
    var body: some View {
        Divider()
        
        Text("Random Number \(randomNumber)")
        Button(action: {
            randomNumber = (0..<1000).randomElement()!
        }, label: {
            Text("Generate Random Number")
        })
        Divider()
        
        CounterView()
        
    }
}


struct CounterView: View {
    
    @StateObject var increment: Person = Person()
    
    var body: some View {
        
        VStack{
            Text("Increment: \(increment.value)")
            Button(action: {
                increment.increasedAmount()
            }, label: {
                Text("Click Me")
            })
        }
    }
}

#Preview {
    ObservableViewTest()
}

class Person : ObservableObject {
   @Published var value: Int = 0
    
    func increasedAmount(){
        value+=1
        //objectWillChange.send()
        
    }
}

