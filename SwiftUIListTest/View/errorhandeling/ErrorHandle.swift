//
//  ErrorHandle.swift
//  SwiftUIListTest
//
//  Created by Masud  Parvez on 20/1/25.
//

import SwiftUI




enum ValidationError : Error {
    case invalidInput
    case missingInput
    case alreadyInUse
}

extension ValidationError : LocalizedError {
    var errorDescription: String? {
        switch self {
        case .alreadyInUse:
            return "User Name already used"
        case .missingInput:
            return "User Name missing input"
        case .invalidInput :
            return "Invalid Input"
        }
    }
}

class InputValidator {
    
    
    var nameList = ["pavel", "robin", "rony"]
    
    func valiDateInut(input : String) throws{
        guard !input.isEmpty else {
            throw ValidationError.missingInput
        }
        
        guard input.count > 2 else {
            throw ValidationError.invalidInput
        }
        
        guard !nameList.contains(input) else {
            throw ValidationError.alreadyInUse
        }
    }
    
    
    func valiDatewithTypeError(input : String) throws(ValidationError){
        guard !input.isEmpty else {
            throw .missingInput
        }
        
        guard input.count > 2 else {
            throw .invalidInput
        }
        
        guard !nameList.contains(input) else {
            throw .alreadyInUse
        }
    }
    
    
}
    

struct ErrorHandle: View {
    
    
    @State var editName : String = ""
    @State private var errorMessage : String?
    @State private var successMessage : String?
    
    private let validator = InputValidator()
    
    
    var body: some View {
        VStack(alignment: .leading){
            
            TextField("Name", text: $editName)
                .padding()
                .background(Color(.systemGroupedBackground))
                .clipShape(.rect(cornerRadius: 10))
                .padding(.leading, 10)
                .padding(.trailing , 10)
            
            if let errorMessage = errorMessage {
                Text("\(errorMessage)")
            } else if let successMessage = successMessage {
                Text("\(successMessage)")
            }
            
            Text("Create Account")
                .padding(.trailing , 10)
                .frame(maxWidth: .infinity,alignment: .trailing)
                .onTapGesture{
                    print("Hello")
                }
            
            Button(action: {
                
                do throws(ValidationError){
                    try validator.valiDatewithTypeError(input: editName)
                    self.successMessage = "Successs"
                    self.errorMessage = nil
                } catch let error {
                    self.errorMessage = error.localizedDescription
                    
                    switch error {
                    case .alreadyInUse:
                        print("Already in use")
                    case .invalidInput:
                        print("Invalid input")
                    case .missingInput :
                        print("Missing input")
                        
                    }
                }
                
            }, label: {
                Text("Login")
                    .font(.system(.body , design: .rounded))
                    .bold()
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(12)
                    .padding()
                
            }).frame(alignment: .trailing)
            
            
            Button("Button 1") {
                
                
            }
                .padding()
                .frame(width: 120 , height: 50)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
            
            
//            VStack(alignment: .trailing, spacing: 20) {
//                Button("Button 1") { }
//                    .padding()
//                    .frame(maxWidth: .infinity)
//                    .background(Color.blue)
//                    .foregroundColor(.white)
//                    .cornerRadius(8)
//
//                Button("Button 2") { }
//                    .padding()
//                    .background(Color.green)
//                    .foregroundColor(.white)
//                    .cornerRadius(8)
//            }
            
        }
    }
}

#Preview {
    ErrorHandle()
}
