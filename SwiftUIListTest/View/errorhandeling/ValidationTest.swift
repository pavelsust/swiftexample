////
////  ValidationTest.swift
////  SwiftUIListTest
////
////  Created by Masud  Parvez on 20/1/25.
////
//
//import SwiftUI
//
//
//enum ValidationError : Error {
//    case invalidInput
//    case missingInput
//    case userAlready
//}
//
//
//extension ValidationError : LocalizedError {
//    var errorDescription: String?{
//        switch self {
//        case .invalidInput:
//            return "Invalid Input"
//            
//        case .missingInput :
//            return "Missing Input"
//            
//        case .userAlready :
//            return "User Already Exist"
//        }
//        
//    }
//}
//
//
//class InputValidator {
//    
//    let userName = ["Pavel", "robin"]
//    
//    func validateInputWithError(input :String) throws(ValidationError) {
//        guard !input.isEmpty else {
//            throw .missingInput
//        }
//        
//        guard input.count > 2 else {
//            throw .invalidInput
//        }
//        
//        guard !userName.contains(input) else {
//            throw .userAlready
//        }
//    }
//}
//
//struct ValidationTest: View {
//    
//    @State private var errorMessage : String?
//    @State private var successMessage : String?
//    @State private var editText : String = ""
//    
//    private var inputValidation = InputValidator()
//    
//    
//    var body: some View {
//        VStack(alignment: .leading){
//            TextField("Name", text: $editText)
//                            .padding()
//                            .background(Color(.systemGroupedBackground))
//                            .clipShape(.rect(cornerRadius: 10))
//                            .padding(.leading, 10)
//                            .padding(.trailing , 10)
//            
//            if let successMessage = successMessage {
//                Text("\(successMessage)")
//                    .background(Color.green)
//            }else if let errorMessage = errorMessage {
//                Text("\(errorMessage)")
//                    .background(Color.red)
//            }
//            
//            Button("Ok"){
//                do throws(ValidationError){
//                    try inputValidation.validateInputWithError(input: editText)
//                    self.errorMessage = nil
//                    self.successMessage = "Success"
//                }catch let error {
//                    self.errorMessage = error.localizedDescription
//                    switch error {
//                    case .invalidInput:
//                        print("Invalid Input")
//                    case .missingInput:
//                        print("Missing Input")
//                    case .userAlready :
//                        print("User Input wrong")
//                        
//                    }
//                }
//                
//            }
//            .frame(maxWidth: .infinity)
//        }
//    }
//}
//
//#Preview {
//    ValidationTest()
//}
