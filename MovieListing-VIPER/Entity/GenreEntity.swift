//
//  GenreEntity.swift
//  MovieListing-VIPER
//
//  Created by Audrey Aurelia Chang on 04/09/22.
//

import Foundation

struct Genre{
    let genreId: Int
    let genreName: String
}

extension Genre: Decodable{
    enum CodingKeys: String, CodingKey{
        case genreId = "id"
        case genreName = "name"
    }
}

struct Genres{
    let genres: [Genre]
}


