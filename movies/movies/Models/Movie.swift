//
//  Movie.swift
//  movies
//
//  Created by Lisandro on 24/11/2018.
//  Copyright © 2018 Lisandro. All rights reserved.
//
import UIKit

class Movie: Codable {
    let id: Int64
    let title: String
    let voteAverage: Double
    let voteCount: Double
    let posterPath: String?
    let overview: String
    let runtime: Int16
    var releaseDate: Date?
    var poster: UIImage?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case posterPath = "poster_path"
        case overview
        case runtime
        case releaseDate = "release_date"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int64.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        
        voteAverage = try container.decodeIfPresent(Double.self, forKey: .voteAverage)
            ?? 0
        
        voteCount = try container.decodeIfPresent(Double.self, forKey: .voteCount)
            ?? 0
        
        posterPath = try container.decodeIfPresent(String.self, forKey: .posterPath)
        overview = try container.decode(String.self, forKey: .overview)
        
        runtime = try container.decodeIfPresent(Int16.self, forKey: .runtime)
            ?? 0
        
        let dateString = try container.decodeIfPresent(String.self, forKey: .releaseDate)
        releaseDate = dateString?.dateFromString
    }

    init(id: Int64, title: String) {
        self.id = id
        self.title = title
        voteAverage = 0
        voteCount = 0
        overview = ""
        runtime = 0
        posterPath = nil
    }
}

// MARK - Funcionality
extension Movie {
    static func topRated(page: Int = 1) -> Resource<MoviesResult>? {
        let apiKey = "208ca80d1e219453796a7f9792d16776"
        let urlAsString = "\(AppParameters.API.url)/tv/top_rated" +
            "?api_key=\(apiKey)" +
            "&language=\(String.languageFormattedForTMDb)" +
            "&region=\(String.regionIso31661)" +
            "&page=\(page)"
        
        return Resource(url: urlAsString, method: .get) { data in
            do {
                let paginatedMovies = try JSONDecoder()
                    .decode(MoviesResult.self, from: data)
                return paginatedMovies
            } catch {
                print(error)
                return nil
            }
        }
    }
}
