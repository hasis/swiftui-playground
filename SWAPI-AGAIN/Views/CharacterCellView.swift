//
//  CharacterCellView.swift
//  SWAPI-AGAIN
//
//  Created by Nikita Hasis on 7/1/20.
//  Copyright © 2020 Nikita Hasis. All rights reserved.
//

import SwiftUI
import URLImage

struct CharacterCellView: View {
    @State var item: CharacterResult
    @State var showingDetail = false
    @EnvironmentObject var favorites: Favorites
        
    var body: some View {
        HStack(alignment: .center) {
            URLImage(self.item.image,
                delay: 0.5,
                placeholder: Image(systemName: "circle"),
                content:  {
                    $0.image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipped()
                })
            .frame(width: 50, height: 50)
            .clipShape(RoundedRectangle(cornerRadius: 50))
            
            VStack (alignment: .leading) {
                Text(self.item.name)
                    .font(.headline)
                Text(self.item.origin["name"]!)
            }
            
            if (self.favorites.contains(item: self.item)) {
                Spacer()
                Image(systemName: ("star.fill"))
                .frame(width: 50, height: 50)
                .foregroundColor(.yellow)
            }
        }
        .onTapGesture {
            self.showingDetail = true
        }
        .sheet(isPresented: self.$showingDetail) {
            CardView(item: self.item)
                .environmentObject(self.favorites)
        }
    }
}

struct CharacterCellView_Previews: PreviewProvider {
    static let favorites = Favorites()

    static var previews: some View {
        CharacterCellView(item: CharacterResult(
        id: 1,
        created: "...",
        name: "Bob Bobson",
        gender: "n/a",
        status: "Alive",
        url: "www.google.com",
        species: "N/A",
        image: URL(string: "https://rickandmortyapi.com/api/character/avatar/32.jpeg")!,
        type: "Type",
        location: ["name": "Earth"],
        origin: ["name": "Earth"]
        )).environmentObject(favorites)
    }
}
