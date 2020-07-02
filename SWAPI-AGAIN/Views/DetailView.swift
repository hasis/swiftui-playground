//
//  DetailView.swift
//  SWAPI-AGAIN
//
//  Created by Nikita Hasis on 6/28/20.
//  Copyright © 2020 Nikita Hasis. All rights reserved.
//

import SwiftUI
import URLImage

struct DetailView: View {
    @State var item: CharacterResult
    @EnvironmentObject var favorites: Favorites

    var body: some View {
        VStack (alignment: .center) {
            
            VStack {
                Text(item.name).font(.largeTitle)
                URLImage(item.image)
                    .padding()
                    .frame(width: 300, height: 300)
                    .clipShape(RoundedRectangle(cornerRadius: 180))
                Button(action: {
                    self.favorites.add(item: self.item)
                }) {
                    Text("Favorite")
                        .font(.headline)
                }
            }
            
            HStack {
                Text("Origin:")
                    .bold()
                Text(item.origin["name"]!)
                Spacer()
            }
            
            HStack{
                Text("Location:")
                    .bold()
                Text(item.location["name"]!)
                Spacer()
            }

            HStack {
                Text("Type:")
                    .bold()
                Text(item.type)
                Spacer()
            }
            HStack {
                Text("Gender:")
                    .bold()
                Text(item.gender)
                Spacer()
            }
            HStack {
                Text("Species:")
                    .bold()
                Text(item.species)
                Spacer()
            }
            
            HStack {
                Text("Status:")
                    .bold()
                Text(item.status)
                Spacer()
            }
            Spacer()
        }
        .padding()
        .navigationBarTitle(item.name)
        .environmentObject(favorites)
    }
}

struct DetailView_Previews: PreviewProvider {
    static let favorites = Favorites()
    
    static var previews: some View {

        DetailView(item: CharacterResult(
            id: 1,
            created: "...",
            name: "Bob",
            gender: "n/a",
            status: "DEAD",
            url: "www.google.com",
            species: "N/A",
            image: URL(string: "https://rickandmortyapi.com/api/character/avatar/2.jpeg")!,
            type: "Type",
            location: ["name": "Earth"],
            origin: ["name": "Earth"]
            )
        ).environmentObject(favorites)
    }
}
