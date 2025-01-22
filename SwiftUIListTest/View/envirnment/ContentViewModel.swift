//
//  ContentViewModel.swift
//  SwiftUIListTest
//
//  Created by Masud  Parvez on 30/5/24.
//

import Foundation

class ContentViewModel : ObservableObject{
    @Published var user : User
    
    init() {
        self.user = User(fullName: "Masud Parvez", email: "pavelcep.sust11@gmail.com", address: "Demra Dhaka")
    }
}
