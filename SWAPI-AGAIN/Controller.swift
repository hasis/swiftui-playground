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

struct CharacterResult: Codable {
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

