//
//  GenreEntity.swift
//  MovieListing-VIPER
//
//  Created by Audrey Aurelia Chang on 04/09/22.
//

import Foundation

//MARK: Struct for Genre and Genres data model
struct Genre{
    let genreId: Int
    let genreName: String
}

extension Genre: Decodable{
    enum CodingKeys: String, CodingKey{
        case genreId = "id"
        case genreName = "name"
    }
    
    init(from decoder: Decoder) throws{
        let container = try decoder.container(keyedBy: CodingKeys.self)
        genreId = try container.decode(Int.self, forKey: .genreId)
        genreName = try container.decode(String.self, forKey: .genreName)
    }
}

struct Genres: Decodable{
    let genres: [Genre]
}



