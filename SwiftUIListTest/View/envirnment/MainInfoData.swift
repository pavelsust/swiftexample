//
//  MainInfoData.swift
//  SwiftUIListTest
//
//  Created by Masud  Parvez on 2/6/24.
//

import Foundation

class MainInfoData : ObservableObject{
    @Published var infoData : InfoData
    
    init(){
        self.infoData = InfoData(name: "Pavel", email: "Pavelcep.sust11@gmail.com", address: "Demra Dhaka")
    }
}
