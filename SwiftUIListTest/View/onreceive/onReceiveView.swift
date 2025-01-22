//
//  onReceiveView.swift
//  SwiftUIListTest
//
//  Created by Masud  Parvez on 11/6/24.
//

import SwiftUI

struct onReceiveView: View {
    
    @State var timing = 60
    
    var body: some View {
        Text("\(timing)")
            .onReceive(Timer.publish(every: 1, on: .main, in: .common).autoconnect(), perform: { _ in
                if(timing > 0){
                    timing -= 1
                }
            })
    }
}

#Preview {
    onReceiveView()
}
