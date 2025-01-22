//
//  NotificationView.swift
//  SwiftUIListTest
//
//  Created by Masud  Parvez on 28/7/24.
//

import SwiftUI

struct NotificationView: View {
    
    @State private var newTask : String?
    
    var body: some View {
        
        Button("Post Notification"){
            NotificationCenter.default.post(name: Notification.Name.taskAddedNotification, object: "Do launtry")
        }
        
        Text(newTask ?? "No Task received")
            .onReceive(NotificationCenter.default.publisher(for: Notification.Name.taskAddedNotification), perform: { value in
                self.newTask = value.object as? String
            })
    }
}

#Preview {
    NotificationView()
}
