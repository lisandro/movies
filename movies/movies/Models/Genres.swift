//
//  Genres.swift
//  movies
//
//  Created by Lisandro on 24/11/2018.
//  Copyright © 2018 Lisandro. All rights reserved.
//

import Foundation

struct Genre: Codable {
    let id: Int
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
    }
}

struct Genres: Codable {
    let genres: [Genre]
    
    enum CodingKeys: String, CodingKey {
        case genres
    }
}
