//
//  CustomNavigationLink.swift
//  SwiftUIListTest
//
//  Created by Masud  Parvez on 15/1/24.
//

import Foundation
import SwiftUI

struct CustomNavigationLink<D: View, L: View>: View {
    
  @ViewBuilder var destination: () -> D
  @ViewBuilder var label: () -> L
  
  @State private var isActive = false
  
  var body: some View {
    Button {
      withAnimation {
        isActive = true
      }
    } label: {
      label()
    }
    .onAppear {
      isActive = false
    }
    .overlay {
      NavigationLink(isActive: $isActive) {
        destination()
      } label: {
        EmptyView()
      }
      .opacity(0)
    }
  }
}
