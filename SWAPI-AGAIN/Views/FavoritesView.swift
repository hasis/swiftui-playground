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
        NavigationView {
            VStack {
                List(self.favorites.favorites, id: \.id) { item in
                    Button(action: {
                        self.showingDetail = true
                    }) {
                        CharacterCellView(item: item)
                    }
                    .sheet(isPresented: self.$showingDetail) {
                        DetailView(item: item)
                            .environmentObject(self.favorites)
                    }
                    
                }
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

