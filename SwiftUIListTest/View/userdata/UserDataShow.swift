//
//  UserDataShow.swift
//  SwiftUIListTest
//
//  Created by Masud  Parvez on 27/5/24.
//

import SwiftUI

struct UserDataShow: View {
    
    @ObservedObject var userDefault = UserDefaultManager()
    @ObservedObject var personInformation = PersonInformation()
    @State var userName :String = ""
    
    init() {
        userName = userDefault.apiToken
    }
    
    var body: some View {
        Text("User name is \(userDefault.apiToken)")
        VStack{
            TextField("Enter your name", text: $userName)
            
            Button("Ok", action: {
                personInformation.name = "\(userName)"
                userDefault.apiToken = "\(userName)"
            })
            
            Button("Remove All", action: {
                userDefault.clearAllData()
                
            })
        }
    }
}

#Preview {
    UserDataShow()
}
