//
//  User.swift
//  SwiftUIListTest
//
//  Created by Masud  Parvez on 30/5/24.
//

import Foundation


class User {
    
    let fullName: String
    var email :String
    var address: String
    
    init(fullName: String, email: String, address: String) {
        self.fullName = fullName
        self.email = email
        self.address = address
    }
    
    var initials: String? {
        let formatter = PersonNameComponentsFormatter()
        guard let components = formatter.personNameComponents(from: fullName) else {
            return nil
        }
        formatter.style = .abbreviated
        return formatter.string(from: components)
    }
}
