//
//  SwiftUIListTestApp.swift
//  SwiftUIListTest
//
//  Created by Masud  Parvez on 14/1/24.
//

import SwiftUI

@main
struct SwiftUIListTestApp: App {
    
    @StateObject var viewModel : MainInfoData = MainInfoData()
    @StateObject var contentViewModel : ContentViewModel = ContentViewModel()
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            LoginScreen()
                .environmentObject(viewModel)
                .environmentObject(contentViewModel)
                .preferredColorScheme(.light)
        }
    }
}
