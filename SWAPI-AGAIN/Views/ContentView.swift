//
//  ContentView.swift
//  SWAPI-AGAIN
//
//  Created by Nikita Hasis on 6/28/20.
//  Copyright © 2020 Nikita Hasis. All rights reserved.
//

import SwiftUI
import URLImage


struct ContentView: View {
    var body: some View {
        TabView {
            VStack (alignment: .leading) {
                CardStackView()
                .navigationBarTitle("Characters")
            }
            .tabItem {
             Image(systemName: "magnifyingglass")
             Text("Characters")
           }
        FavoritesView()
            .tabItem {
              Image(systemName: "suit.heart.fill")
              Text("Favorites")
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static let favorites = Favorites()

    static var previews: some View {
        ContentView().environmentObject(self.favorites)
    }
}
