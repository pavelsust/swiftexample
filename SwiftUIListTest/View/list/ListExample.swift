//
//  ListExample.swift
//  SwiftUIListTest
//
//  Created by Masud  Parvez on 26/8/24.
//

import SwiftUI



struct CardBrand: Identifiable , Hashable{
    var title: String
    var id = NSUUID().uuidString
}

struct Cars : Identifiable , Hashable{
    var title :String
    var id = UUID()
}

struct ListExample: View {
    
    var brands : [CardBrand] = [CardBrand(title: "Hello 1", id: "2"),
    CardBrand(title: "Hello 2", id: "3")]
    
    var cars : [Cars] = [Cars(title: "Lamborgini"), Cars(title: "Ferari"),Cars(title: "Lamborgini"), Cars(title: "Ferari"),]
    
    var body: some View {
        NavigationStack{
            List{
                Section("Car Company"){
                    ForEach(brands){item in
                        NavigationLink(value: item){
                            Text("\(item.title)")
                        }
                    }
                }
                
                Section("Car Name"){
                    ForEach(cars){item in
                        NavigationLink(value: item){
                            Text("\(item.title)")
                        }
                    }
                }
            }
            .navigationDestination(for: CardBrand.self){item in
                ListDetails(title: item.title)
            }
            
            .navigationDestination(for: Cars.self){item in
                viewForCars(cars: item)
            }
        }
        
    }
    
   
    func viewForCars(cars: Cars) ->  AnyView{
        switch cars.title{
        case "Lamborgini":
            return AnyView(Color(.systemRed))
        case "Ferari":
            return AnyView(Color(.systemPurple))
        default :
            return AnyView(Color(.systemBlue))
        }
    }
}


struct ListDetails : View {
    var title :String
    var body: some View {
        Text("\(title)")
    }
}

#Preview {
    ListExample()
}
