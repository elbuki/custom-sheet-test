//
//  ItemDetailView.swift
//  CustomSheetTest
//
//  Created by Marco Carmona on 10/3/22.
//

import SwiftUI

struct ItemDetailView: View {
    let item: CatalogItem
    
    @Binding var isPresented: Bool
    
    init(item: CatalogItem, isPresented: Binding<Bool>) {
        self.item = item
        self._isPresented = isPresented
    }
    
    var body: some View {
        ZStack {
            Color.purple.edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 25) {
                Image(item.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 300, height: 300)
                    .cornerRadius(20)
                    .clipped()
                    .shadow(color: .black.opacity(0.25), radius: 5, x: 4, y: 4)
                
                Text(item.title)
                    .font(.system(size: 40, weight: .bold))
                    .foregroundColor(.white)
                
                Text("Price: $\(item.price)")
                    .font(.system(size: 30))
                    .foregroundColor(.white)
                
                Spacer().frame(height: 40)
                
                Button(
                    action: {
                        print("Purchase button is clicked.")
                    },
                    label: {
                        Text("Purchase")
                            .font(.system(size: 24, weight: .medium))
                            .foregroundColor(.purple)
                            .frame(width: 220, height: 65)
                            .background(.white)
                            .cornerRadius(20)
                    }
                )
            }
        }
    }
}

struct ItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetailView(
            item: .init(title: "Something", imageName: "???", price: 2000),
            isPresented: .constant(false)
        )
    }
}
