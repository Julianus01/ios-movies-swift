//
//  Movie.swift
//  Movies
//
//  Created by Iulian Crisan on 03/03/2020.
//  Copyright © 2020 julianc. All rights reserved.
//

struct Movie: Codable {
    var id: Int
    var title: String
    var overview: String
    var releaseDate: String
    var voteAverage: Double
    var posterPath: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case overview = "overview"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
        case posterPath = "poster_path"
    }
}
