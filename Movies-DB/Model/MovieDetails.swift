//
//  MovieDetails.swift
//  Movies-DB
//
//  Created by Abdelrahman Sobhy on 3/29/21.
//

import Foundation
struct MovieDetails: Codable {
    let adult: Bool
    let budget, id: Int
    let imdbID, originalLanguage, overview: String
    let popularity: Double
    let posterPath, backdropPath, releaseDate: String
    let revenue, runtime: Int
    let status, title: String
    let voteAverage: Double
    let voteCount: Int

    enum CodingKeys: String, CodingKey {
        case adult, budget, id
        case imdbID = "imdb_id"
        case originalLanguage = "original_language"
        case overview, popularity
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case releaseDate = "release_date"
        case revenue, runtime, status, title
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

struct MovieDetailsViewModel {
    private let baseImageUrl = "https://image.tmdb.org/t/p/w500"
    let overview: String
    let posterPath, backdropPath, releaseDate: String
    let title: String
    let voteAverage: Double
    
    init(movie: MovieDetails) {
        self.overview = movie.overview
        self.backdropPath = baseImageUrl + movie.backdropPath
        self.posterPath = baseImageUrl + movie.posterPath
        self.releaseDate = movie.releaseDate
        self.title = movie.title
        self.voteAverage = movie.voteAverage
    }
}
