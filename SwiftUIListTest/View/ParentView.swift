//
//  ParentView.swift
//  SwiftUIListTest
//
//  Created by Masud  Parvez on 15/3/24.
//

import SwiftUI

struct ParentView: View {
    
    @State private var toggleState = false
    
    var body: some View {
        VStack{
            ChildView(isToggled: $toggleState)
            Text("Toggle State: \(toggleState.description)")
        }
    }
}

#Preview {
    ParentView()
}


struct ChildView: View {
    
    @Binding var isToggled: Bool
    
    var body: some View {
        Toggle("Toggle", isOn: $isToggled)
    }
}
