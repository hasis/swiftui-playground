//
//  Controller.swift
//  SWAPI-AGAIN
//
//  Created by Nikita Hasis on 6/28/20.
//  Copyright © 2020 Nikita Hasis. All rights reserved.
//

import Foundation

struct Response: Codable {
    var results: [CharacterResult]
}

struct CharacterResult: Codable, Equatable, Hashable {
    var id: Int
    var created: String
    var name: String
    var gender: String
    var status: String
    var url: String
    var species: String
    var image: URL
    var type: String
    var location: [String: String]
    var origin: [String: String]
}

class Favorites: ObservableObject {
    @Published var favorites = [CharacterResult]()

    func add(item: CharacterResult) {
        favorites.append(item)
        print(favorites)
    }
    
    func contains(item: CharacterResult) -> Bool {
        if (favorites.contains(item)) {
            return true
        } else {
            return false
        }
    }

    func remove(item: CharacterResult) {
        if let index = favorites.firstIndex(of: item) {
            favorites.remove(at: index)
        }
    }
}

extension Array where Element: Hashable {
    func removingDuplicates() -> [Element] {
        var addedDict = [Element: Bool]()

        return filter {
            addedDict.updateValue(true, forKey: $0) == nil
        }
    }

    mutating func removeDuplicates() {
        self = self.removingDuplicates()
    }
}

