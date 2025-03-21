//
//  ListView.swift
//  SwiftUIListTest
//
//  Created by Masud  Parvez on 14/1/24.
//

import SwiftUI

struct ListView: View {
    
    
    @State private var showFavouriteOnly = false
    
    var animalList = [Animal(id: 1, title: "Title 1", isFavourite: true),
                      Animal(id: 2, title: "Title 2", isFavourite: false),
                      Animal(id: 3, title: "Title 3", isFavourite: true),
                      Animal(id: 4, title: "Title 4", isFavourite: false),
                      Animal(id: 5, title: "Title 5", isFavourite: false)]
    
    
    var filternedAnimalList : [Animal] {
        animalList.filter{ animal in
            ( !showFavouriteOnly || animal.isFavourite)
        }
    }
    
//    var body: some View {
//        NavigationStack{
//            List{
//                Toggle("Only Favourite Show", isOn: $showFavouriteOnly)
//                ForEach(filternedAnimalList, id: \.title){ animal in
//                    NavigationLink(destination: DetailsView()){
//                        CustomList(animal: animal)
//                    }
//                }
//            }
//            .navigationTitle("Hiking Trails")
//        }
//        
//    }
    
    
//    var body: some View{
//        NavigationSplitView{
//            
//            List(animalList, id: \.id){animal in
//                
//                NavigationLink{
//                    DetailsView()
//                } label: {
//                    CustomList(animal: animal)
//                }
//            }
//            .navigationTitle("Custom List")
//        } detail: {
//           Text("Hello World")
//        }
//    }
    
    
    @State private var filter = FilterCategory.all
    @State private var showFavoritesOnly = false
    
    enum FilterCategory: String , CaseIterable, Identifiable{
        case all = "All"
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
        
        var id: FilterCategory {self}
    }
    
    var body: some View{
        
        NavigationStack{
            ScrollView(.vertical , showsIndicators: false){
                ForEach(animalList , id: \.id){ animal in
                    NavigationLink{
                        DetailsView()
                    }label: {
                        CustomList(animal: animal, contentClick: {value in
                            print("\(value)")
                        })
                        
                    }
                }
            }
            .navigationTitle("List Item")
            .toolbar{
                ToolbarItem {
                    
                    Menu {
                        Picker("Category", selection: $filter){
                            ForEach(FilterCategory.allCases){ category in
                                
                                Text(category.rawValue).tag(category)}
                            
                        }.pickerStyle(.inline)
                        
                    }
                     label: {
                         Label("Filter", systemImage: "slider.horizontal.3")
                     }
                }
            }
        }
    }
}

#Preview {
    ListView()
}


struct HorizontalScreen : View {
    
    var animalList = [Animal(id: 1, title: "Title 1", isFavourite: true),
                      Animal(id: 2, title: "Title 2", isFavourite: false),
                      Animal(id: 3, title: "Title 3", isFavourite: true),
                      Animal(id: 4, title: "Title 4", isFavourite: false),
                      Animal(id: 5, title: "Title 5", isFavourite: false)]
    
    
    
    var body: some View {
        VStack(alignment: .leading){
         Text("Category Name")
                .font(.headline)
                .padding(.leading , 15)
                .padding(.top , 10)
            
            ScrollView(.horizontal , showsIndicators: false){
                LazyHStack(alignment: .top, spacing: 0){
                    ForEach(animalList , id: \.id){ animal in
                     CustomHorizontalItem()
                    }
                }
            }
        }
    }
    
}

struct CustomHorizontalItem : View {
    var body: some View {
        VStack{
            Image("hiddenlake")
                .resizable()
                .frame(width: 200, height: 200)
            Text("Hidden Lake")
        }
        .padding(.leading , 15)
    }
}

