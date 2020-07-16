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
    @State var pageIndex: Int = 1
    @State var searchString: String = ""
    @EnvironmentObject var favorites: Favorites
    
    private func getNextPageIfNecessary(encounteredIndex: Int) {
        guard encounteredIndex == results.count - 1 else { return }
        pageIndex += 1
        self.loadData(index: pageIndex)
    }
    
    func loadData(index: Int) {
        var url = String()
        
        url = "https://rickandmortyapi.com/api/character/?page=\(index)&name=\(searchString)"
                guard let apiURL = URL(string: url) else {
            print("Invalid URL")
            return
        }
        
        let request = URLRequest(url: apiURL)

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {

                if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                    DispatchQueue.main.async {
                        self.results.append(contentsOf: decodedResponse.results)
                        self.results = self.results.removingDuplicates()
                    }
                    return
                }
            }

            // if we're still here it means there was a problem
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
        }.resume()
    }

    var body: some View {
        VStack {
            HStack {
                ZStack {
                    TextField("Search",
                              text: $searchString,
                              onCommit: {
                                self.results.removeAll();
                                self.pageIndex = 0;
                                self.loadData(index: self.pageIndex)
                    })
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    
                    Image(systemName: "xmark.circle.fill")
                        .offset(x: 120)
                        .onTapGesture {
                            self.results.removeAll();
                            self.searchString = ""
                            self.pageIndex = 0
                            self.loadData(index: self.pageIndex)
                        }
                    }.padding()
                
                Button(action: {
                    self.results.removeAll();
                    self.pageIndex = 0;
                    self.loadData(index: self.pageIndex);
                }) {
                    Image(systemName: "magnifyingglass")
                }
            }.padding()
            
            List(0..<results.count, id: \.self) { index in
                HStack {
                    CharacterCellView(item: self.results[index])
                        }.onAppear {
                            self.getNextPageIfNecessary(encounteredIndex: index)
                    }
            }.onAppear {self.loadData(index: self.pageIndex)}
        }
    }
}

struct CharacterListView_Previews: PreviewProvider {
    static let favorites = Favorites()

    static var previews: some View {
        CharacterListView().environmentObject(favorites)
    }
}
