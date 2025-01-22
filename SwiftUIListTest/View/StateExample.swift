//
//  StateExample.swift
//  SwiftUIListTest
//
//  Created by Masud  Parvez on 13/2/24.
//

import SwiftUI

struct StateExample: View {
    
    @State private var isDarkMoodEnabled = false
    @State private var showDetailsView = false
    
    
    var body: some View{
        ZStack{
            Color(isDarkMoodEnabled ? .yellow : .white)
            VStack{
                Toggle(isOn: $isDarkMoodEnabled){
                    Text("Dark Mood")
                        .foregroundColor(isDarkMoodEnabled ? .white : .black)
                }
                
                Button(action: {
                    showDetailsView = true
                }, label: {
                    Text("Show Detail View")
                })
            }
            .padding()
        }
        .sheet(isPresented: $showDetailsView, content: {
            ShowStateDetailView()
        })
        .ignoresSafeArea()
    }
}

#Preview {
    StateExample()
}
