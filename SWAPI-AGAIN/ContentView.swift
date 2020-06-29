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
    @State private var results = [CharacterResult]()
    @State var showingDetail = false
    
    func loadData() {
        guard let swapiURL = URL(string: "https://rickandmortyapi.com/api/character/") else {
            print("Invalid URL")
            return
        }
        
        let request = URLRequest(url: swapiURL)

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {

                if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                    DispatchQueue.main.async {
                        self.results = decodedResponse.results
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

            Button(action: {
                self.loadData()
            }) {
                Text("LOAD").foregroundColor(.pink)
            }
            
            List(results, id: \.url) { item in
                HStack(alignment: .center) {
                    
                    URLImage(item.image,
                        delay: 0.25,
                        content:  {
                            $0.image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .clipped()
                        })
                    .frame(width: 50, height: 50)
                    .clipShape(RoundedRectangle(cornerRadius: 50))
                    
                    Button(action: {
                        self.showingDetail = true
                    }) {
                        Text(item.name)
                            .font(.headline)
                       
                    }
                    .sheet(isPresented: self.$showingDetail) {
                        DetailView(item: item)
                    }
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
