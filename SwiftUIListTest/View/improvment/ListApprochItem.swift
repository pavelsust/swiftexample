//
//  ListApprochItem.swift
//  SwiftUIListTest
//
//  Created by Masud  Parvez on 15/9/24.
//

import Foundation


struct ListApprochItem : Identifiable {
    let id = UUID()
    let title : String
    let description : String
    let price : Double
    var isFavourite : Bool
}

class ListApprochViewModel : ObservableObject {
    @Published var items : [ListApprochItem] = [
        ListApprochItem(title: "Product 1 ", description: "Description 1", price: 10.99, isFavourite: false),
        ListApprochItem(title: "Product 2 ", description: "Description 2", price: 20.99, isFavourite: true),
        ListApprochItem(title: "Product 3 ", description: "Description 3", price: 30.99, isFavourite: false),
        ListApprochItem(title: "Product 4 ", description: "Description 4", price: 40.99, isFavourite: true),
        ListApprochItem(title: "Product 5 ", description: "Description 5", price: 20.99, isFavourite: false),
    ]
    
    func toggleFavorite(for item: ListApprochItem) {
            if let index = items.firstIndex(where: { $0.id == item.id }) {
                items[index].isFavourite.toggle()
            }
        }
    
    
    func makeFavourite(for item : ListApprochItem) {
        if let index = items.firstIndex(where: {item.id == $0.id}){
            items[index].isFavourite.toggle()
        } else{
            print("Item not found")
        }
    }
  
}
