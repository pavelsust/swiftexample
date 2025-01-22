//
//  ScaneView.swift
//  SwiftUIListTest
//
//  Created by Masud  Parvez on 2/6/24.
//

import SwiftUI

struct ScaneView: View {
    
    
    @Environment(\.scenePhase) var scanePhase
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onChange(of: scanePhase) { newPhaseIn in
                if newPhaseIn == .inactive{
                    debugPrint("Scane Inactive from debug")
                    print("Scane Inactive")
                } else if newPhaseIn == .active {
                    print("Scane Active")
                } else if newPhaseIn == .background {
                    print("Scane Background")
                }
            }
    }
}

#Preview {
    ScaneView()
}
