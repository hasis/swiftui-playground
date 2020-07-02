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
        NavigationView {
            VStack (alignment: .leading) {
                NavigationLink(destination: FavoritesView()) {
                    Text("View Favorites")
                }
                .padding()
                CharacterListView()
                .navigationBarTitle("Characters")
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
