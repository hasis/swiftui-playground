//
//  CharacterListView.swift
//  SWAPI-AGAIN
//
//  Created by Nikita Hasis on 7/1/20.
//  Copyright © 2020 Nikita Hasis. All rights reserved.
//

import SwiftUI
import URLImage

struct CharacterListView: View {
    @State private var results = [CharacterResult]()
    @State var showingDetail = false
    @State var pageIndex: Int = 1
    @EnvironmentObject var favorites: Favorites

    private func getNextPageIfNecessary(encounteredIndex: Int) {
        guard encounteredIndex == results.count - 1 else { return }
        pageIndex += 1
        self.loadData(index: pageIndex)
    }
    
    func loadData(index: Int) {
        guard let apiURL = URL(string: "https://rickandmortyapi.com/api/character/?page=\(index)") else {
            print("Invalid URL")
            return
        }
        
        let request = URLRequest(url: apiURL)

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {

                if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                    DispatchQueue.main.async {
                        self.results.append(contentsOf: decodedResponse.results)
                    }
                    print("Results: \(self.results.count)")

                    return
                }
            }

            // if we're still here it means there was a problem
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
        }.resume()
    }
    

    var body: some View {
        List(0..<results.count, id: \.self) { index in
            Button(action: {
                self.showingDetail = true
            }) {
                CharacterCellView(item: self.results[index])
            }
            .sheet(isPresented: self.$showingDetail) {
                DetailView(item: self.results[index])
                    .environmentObject(self.favorites)
            }
            .onAppear {
                self.getNextPageIfNecessary(encounteredIndex: index)
            }
        }
        .onAppear {self.loadData(index: self.pageIndex)}
    }
}

struct CharacterListView_Previews: PreviewProvider {
    static let favorites = Favorites()

    static var previews: some View {
        CharacterListView().environmentObject(favorites)
    }
}
