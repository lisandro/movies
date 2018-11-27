//
//  MoviesResult.swift
//  movies
//
//  Created by Lisandro on 25/11/2018.
//  Copyright © 2018 Lisandro. All rights reserved.
//

import Foundation

struct MoviesResult: Codable {
    let page: Int
    let totalResults: Int
    let totalPages: Int
    let results: [Movie]
    
    enum CodingKeys: String, CodingKey {
        case page
        case totalResults = "total_results"
        case totalPages = "total_pages"
        case results
    }
}
