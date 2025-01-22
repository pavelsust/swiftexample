//
//  ListApproachView.swift
//  SwiftUIListTest
//
//  Created by Masud  Parvez on 15/9/24.
//

import SwiftUI
import Combine

struct ListApproachView: View {
    
    @StateObject private var approachViewModel = ListApprochViewModel()
    @State var openDetails = false
   
    
    var body: some View {
        NavigationStack{
            VStack{
                Button(action: {
                    openDetails = true
                }, label: {
                    Text("Button")
                })
            }
            .navigationDestination(isPresented: $openDetails) {
                DetailsView()
            }
            
            List(approachViewModel.items, id: \.id) { item in
                ListApprochChildView(item: item, onFavouriteToggle: { item in
                    approachViewModel.makeFavourite(for: item)
                })
            }
        }
    }
}

#Preview {
    ListApproachView()
}


struct ListApprochChildView : View{
    
    let item : ListApprochItem
    let onFavouriteToggle : (ListApprochItem) -> Void
    
    var body: some View{
        VStack(alignment: .leading) {
            Text(item.title)
                .font(.headline)
            Text(item.description)
                .font(.subheadline)
                .foregroundColor(.gray)
            HStack {
                Text("$\(item.price, specifier: "%.2f")")
                    .font(.callout)
                    .foregroundColor(.blue)
                
                Spacer()
                
                Button(action: {
                    onFavouriteToggle(item)
                }){
                    Image(systemName: item.isFavourite ? "heart.fill" : "heart")
                        .foregroundColor(item.isFavourite ? .red : .gray)
                }
                .buttonStyle(.plain)
                
            }
        }
    }
}
