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
                Text(self.item.status)
            }
        }
    }
}

struct CharacterCellView_Previews: PreviewProvider {

    static var previews: some View {
        CharacterCellView(item: CharacterResult(
        id: 1,
        created: "...",
        name: "Bob Bobson",
        gender: "n/a",
        status: "DEAD",
        url: "www.google.com",
        species: "N/A",
        image: URL(string: "https://rickandmortyapi.com/api/character/avatar/2.jpeg")!,
        type: "Type",
        location: ["name": "Earth"],
        origin: ["name": "Earth"]
        ))
    }
}
