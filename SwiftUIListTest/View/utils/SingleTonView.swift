////
////  SingleTonView.swift
////  SwiftUIListTest
////
////  Created by Masud  Parvez on 21/1/25.
////
//
//import SwiftUI
//
//
//enum ApiEnviornment : String {
//    case devEnviournment
//    case prodEnviournment
//    
//    var endPoint : String {
//        switch self {
//        case .devEnviournment:
//            return "api.dev.com"
//            
//        case .prodEnviournment:
//            return "api.prod.com"
//        }
//        
//    }
//}
//
//class ApiConfiguration {
//    
//    public static var apiConfiguration = ApiConfiguration(apiEnviornment: .prodEnviournment)
//    var apiEnviornment : ApiEnviornment
//    
//    init(apiEnviornment: ApiEnviornment) {
//        self.apiEnviornment = apiEnviornment
//    }
//}
//
//struct SingleTonView: View {
//    
//    var instance = ApiConfiguration.apiConfiguration
//    
//    var body: some View {
//        Text("Hello \(instance.apiEnviornment)")
//    }
//}
//
//#Preview {
//    SingleTonView()
//}
//



import SwiftUI


enum ApiEnviornment: String {
    
    case ProdEnv
    case DevEnv
    
    var endPoint : String  {
        switch self{
        case .DevEnv:
            return "com.dev"
            
        case .ProdEnv:
            return "com.prod"
        }
    }
}


class ApiConfig {
    
    static var instance = ApiConfig(api: .DevEnv)
    var api : ApiEnviornment
    init(api: ApiEnviornment) {
        self.api = api
    }
}


struct SingleTonView : View {
    var body : some View{
        VStack{
            Text("Hello World \(ApiConfig.instance.api)")
        }
    }
}


#Preview{
    SingleTonView()
}
