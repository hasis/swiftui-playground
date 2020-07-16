//
//  FavoritesView.swift
//  SWAPI-AGAIN
//
//  Created by Nikita Hasis on 6/30/20.
//  Copyright © 2020 Nikita Hasis. All rights reserved.
//

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var favorites: Favorites
    @State var showingDetail = false

    var body: some View {
            VStack (alignment: .leading) {
                List(self.favorites.favorites, id: \.id) { item in
                    CharacterCellView(item: item)
                }
            }
        .navigationBarTitle("Favorites")
        .environmentObject(favorites)
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static let favorites = Favorites()

    static var previews: some View {
        FavoritesView().environmentObject(favorites)
    }
}

