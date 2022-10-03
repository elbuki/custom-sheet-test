//
//  ContentView.swift
//  CustomSheetTest
//
//  Created by Marco Carmona on 10/3/22.
//

import SwiftUI

struct CatalogItem: Identifiable {
    let id = UUID()
    let title: String
    let imageName: String
    let price: Int
}

let items = [
    CatalogItem(title: "Phone", imageName: "phone", price: 1000),
    CatalogItem(title: "Lamp", imageName: "lamp", price: 100),
    CatalogItem(title: "Keyboard", imageName: "keyboard", price: 300),
    CatalogItem(title: "Chair", imageName: "chair", price: 700),
    CatalogItem(title: "Book", imageName: "book", price: 100),
]

struct CatalogView: View {
    @State var selectedItem: CatalogItem?
    
    let items: [CatalogItem]
    
    var body: some View {
        let showDetail = Binding {
            self.selectedItem != nil
        } set: {
            if $0 { return }
            
            self.selectedItem = nil
        }
        
        ZStack {
            Color.purple.opacity(0.6)
                .edgesIgnoringSafeArea(.all)
            
            List {
                ForEach(items) { item in
                    CatalogItemView(item: item)
                        .listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                        .onTapGesture {
                            withAnimation {
                                selectedItem = item
                            }
                        }
                }
            }
            .listStyle(.plain)
            .scrollContentBackground(.hidden)
        }
        
        if let selectedItem {
            ItemDetailView(item: selectedItem, isPresented: showDetail)
                .transition(.move(edge: .bottom))
        }
    }
}

struct CatalogItemView: View {
    let item: CatalogItem
    
    var body: some View {
        ZStack {
            Color.purple
            
            HStack {
                Spacer().frame(width: 20)
                
                Image(item.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100)
                    .cornerRadius(10)
                    .clipped()
                    .shadow(color: .black.opacity(0.25), radius: 5, x: 4, y: 4)
                    .padding(.vertical, 5)
                
                Spacer()
                
                VStack(alignment: .center, spacing: 10) {
                    Text(item.title)
                        .font(.title)
                        .foregroundColor(.white)
                    
                    Text("Price: $\(item.price)")
                        .foregroundColor(.white)
                }
                
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 5)
        }
        .cornerRadius(20)
        .frame(height: 120)
    }
}

struct ContentView: View {
    var body: some View {
        CatalogView(items: items)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
