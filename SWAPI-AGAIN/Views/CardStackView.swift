import SwiftUI
import URLImage
import CardStack

struct CardStackView: View {
    @State private var results = [CharacterResult]()
    @State var pageIndex: Int = 1
    @State var searchString: String = ""
    @State var isLoading: Bool = true
    @EnvironmentObject var favorites: Favorites
    
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
                        self.isLoading = false
                    }
                    return
                }
            }

            // if we're still here it means there was a problem
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
        }.resume()
    }
    

    var body: some View {
        CardStack(
                direction: LeftRight.direction,
                data: self.results,
                onSwipe: { card, direction in
                    print("Swiped \(card.name) to \(direction)")
                },
                    content: { item, _, _ in
                        CardView(item: item)
                }
            )
            .padding()
            .scaledToFit()
            .frame(alignment: .center)
            .navigationBarTitle("Basic", displayMode: .inline)
            .onAppear {self.loadData(index: self.pageIndex)}
    }
}

struct CardStackView_Previews: PreviewProvider {
    static let favorites = Favorites()

    static var previews: some View {
        CardStackView().environmentObject(favorites)
    }
}


