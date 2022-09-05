//
//  MovieEntity.swift
//  MovieListing-VIPER
//
//  Created by Audrey Aurelia Chang on 04/09/22.
//

import Foundation

//MARK: Movie Entity
struct Movie{
    let movieId: Int
    let movieTitle: String
    let movieSummary: String
    let moviePoster: String
    let releaseDate: String
//    let genre: [Genre]
//    let productionCompanies: [Companies]
//    let productionCountries: [Countries]
}

struct Companies{
    let companyName: String
}

struct Countries{
    let countryName:String
    
}

//MARK: Movie Trailer Entity
struct MovieTrailer: Decodable{
    let movieTrailerKey: String
    
    enum CodingKeys: String, CodingKey{
        case movieTrailerKey = "key"
    }
    
    init(from decoder: Decoder) throws{
        let container = try decoder.container(keyedBy: CodingKeys.self)
        movieTrailerKey = try container.decode(String.self, forKey: .movieTrailerKey)
    }
}

extension Movie:Decodable{
    enum CodingKeys: String, CodingKey{
        case movieId = "id"
        case movieTitle = "original_title"
        case movieSummary = "overview"
        case moviePoster = "poster_path"
        case releaseDate = "release_date"
    }
    
    init(from decoder: Decoder) throws{
        let container = try decoder.container(keyedBy: CodingKeys.self)
        movieId = try container.decode(Int.self, forKey: .movieId)
        movieTitle = try container.decode(String.self, forKey: .movieTitle)
        movieSummary = try container.decode(String.self, forKey: .movieSummary)
        moviePoster = try container.decode(String.self, forKey: .moviePoster)
        releaseDate = try container.decode(String.self, forKey: .releaseDate)
    }
}
