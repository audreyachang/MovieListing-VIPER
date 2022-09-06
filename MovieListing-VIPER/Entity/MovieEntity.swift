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
    let genre: [Genre]?
}

struct Companies: Decodable{
    let companyId: Int
    let companyName: String
    
    enum CodingKeys: String, CodingKey{
        case companyId = "id"
        case companyName = "name"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        companyId = try container.decode(Int.self, forKey: .companyId)
        companyName = try container.decode(String.self, forKey: .companyName)
    }
}

struct Countries: Decodable{
    let countryISO: Int
    let countryName:String
    
    enum CodingKeys: String, CodingKey{
        case countryISO = "iso_3166_1"
        case countryName = "name"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        countryISO = try container.decode(Int.self, forKey: .countryISO)
        countryName = try container.decode(String.self, forKey: .countryName)
    }
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

struct MovieTrailers: Decodable{
    let movieTrailer: [MovieTrailer]?
    
    enum CodingKeys: String, CodingKey{
        case movieTrailer = "results"
    }
    
    init(from decoder: Decoder) throws{
        let container = try decoder.container(keyedBy: CodingKeys.self)
        movieTrailer = try container.decodeIfPresent([MovieTrailer].self, forKey: .movieTrailer)
    }
}

extension Movie:Decodable{
    enum CodingKeys: String, CodingKey{
        case movieId = "id"
        case movieTitle = "title"
        case movieSummary = "overview"
        case moviePoster = "poster_path"
        case releaseDate = "release_date"
        case genre
    }
    
    init(from decoder: Decoder) throws{
        let container = try decoder.container(keyedBy: CodingKeys.self)
        movieId = try container.decode(Int.self, forKey: .movieId)
        movieTitle = try container.decode(String.self, forKey: .movieTitle)
        movieSummary = try container.decode(String.self, forKey: .movieSummary)
        moviePoster = try container.decode(String.self, forKey: .moviePoster)
        releaseDate = try container.decode(String.self, forKey: .releaseDate)
        genre = try container.decodeIfPresent([Genre].self, forKey: .genre)
    }
}

struct Movies: Decodable{
    let movies: [Movie]?
    
    enum CodingKeys: String, CodingKey{
        case movies = "results"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        movies = try container.decodeIfPresent([Movie].self, forKey: .movies)
    }
}
