//
//  TopRated.swift
//  Movies-DB
//
//  Created by Abdelrahman Sobhy on 3/11/21.
//

import Foundation

import Foundation
struct TopRated : Codable {
    let page: Int
    let results: [MovieResult]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}
struct MovieResult : Codable {
    let adult: Bool
       let backdropPath: String
       let genreIDS: [Int]
       let id: Int
       let originalLanguage, originalTitle, overview: String
       let popularity: Double
       let posterPath, releaseDate, title: String
       let video: Bool
       let voteAverage: Double
       let voteCount: Int

       enum CodingKeys: String, CodingKey {
           case adult
           case backdropPath = "backdrop_path"
           case genreIDS = "genre_ids"
           case id
           case originalLanguage = "original_language"
           case originalTitle = "original_title"
           case overview, popularity
           case posterPath = "poster_path"
           case releaseDate = "release_date"
           case title, video
           case voteAverage = "vote_average"
           case voteCount = "vote_count"
       }
 }

struct ResultViewModel{
    private let baseImageUrl = "https://image.tmdb.org/t/p/w500/"
    let posterUrl: String
    let movieTitle: String
    let movieRate: Double
    let movieRateCount: String
    let movieReleaseDate: String
    let movieOverview: String
    
    let dateFormater: DateFormatter = {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "yyyy-MM-dd"
        return dateFormater
    }()
    
    let dateFormatPrint: DateFormatter = {
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MMM dd,yyyy"
        return dateFormatterPrint
    }()

    
    init(movieResult: MovieResult) {
        self.posterUrl = baseImageUrl+movieResult.posterPath
        self.movieTitle = movieResult.title
        self.movieRate = (movieResult.voteAverage) / 2
        self.movieRateCount = "( \(movieResult.voteCount) )"
        let date = dateFormater.date(from: movieResult.releaseDate)
        self.movieReleaseDate = "\(dateFormatPrint.string(from: date ?? Date())) - \(movieResult.originalLanguage)"
        print(self.movieReleaseDate)
        self.movieOverview = movieResult.overview
    }
}


