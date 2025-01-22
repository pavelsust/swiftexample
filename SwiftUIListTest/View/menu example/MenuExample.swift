//
//  MenuExample.swift
//  SwiftUIListTest
//
//  Created by Masud  Parvez on 7/9/24.
//

import SwiftUI

struct MenuExample: View {
    // State variable to track the number of times a button is clicked
    @State private var clickCount = 0
    // State variable to enable or disable a feature via a toggle
    @State private var isFeatureEnabled = false
    // State variable to control the display of an action sheet
    @State private var showingActionSheet = false
    @State private var showSheet = false
    var body: some View {
        VStack {
            // First button with a simple action that prints a message to the console when clicked
            Button(action: {
                print("Button clicked!")
                showSheet.toggle()
            }) {
                Text("Click Me")
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            
            // Second button that increments the clickCount state variable when clicked
            Button(action: {
                clickCount += 1
            }) {
                HStack {
                    Image(systemName: "plus.app.fill")
                        .foregroundColor(.white)
                        .font(.title)
                    Text("Click Me")
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding()
                .background(Color.blue)
                .cornerRadius(10)
            }
            
            // Text that displays the number of times the second button has been clicked
            Text("Clicked \(clickCount) times")
                .padding()
            
            // A plain style button (no styling by default)
            Button("Plain Button") {
                // Action to be executed when the button is pressed
                print("Button clicked plain!")
            }
            .buttonStyle(PlainButtonStyle())
            .padding()
            
            Button("Bordered Button") {
                // Action to be executed when the button is pressed
                print("Button Clicked Bordered Button!")
            }
            .buttonStyle(BorderedButtonStyle())
            
            // A toggle switch to enable or disable a feature, styled as a button
            Toggle("Enable Feature", isOn: $isFeatureEnabled)
                .toggleStyle(ButtonToggleStyle())
            
            
            // A button that shows an action sheet when clicked
            Button("Show Action Sheet") {
                showingActionSheet = true
            }
            .sheet(isPresented: $showSheet, content: {
                DetailsView()
            })
            .actionSheet(isPresented: $showingActionSheet) {
                ActionSheet(
                    title: Text("Options"),
                    message: Text("Choose an option"),
                    buttons: [
                        
                        .default(Text("Option 1")) {
                            print("Option 1 selected")
                        },
                        .default(Text("Option 2")) {
                            print("Option 2 selected")
                        },
                        .destructive(Text("Delete")) {
                            print("Delete option selected")
                        },
                        .cancel()
                    ]
                )
            }
            .padding()
            
            // A menu with multiple options, each option can perform a different action
            Menu{
                Button("Option 1", action: { /* Action */ })
                Button("Option 2", action: { /* Action */ })
                Button("Option 3", action: { /* Action */ })
            } label: {
                Text("Menu Example")
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .frame(width: 200)
                    
                    
                
            }
        
            
            Link("Open Website", destination: URL(string: "https://www.google.com")!)
            
        }
    }
}

#Preview {
    MenuExample()
}
