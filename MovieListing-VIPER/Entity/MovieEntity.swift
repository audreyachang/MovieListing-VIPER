//
//  MovieEntity.swift
//  MovieListing-VIPER
//
//  Created by Audrey Aurelia Chang on 04/09/22.
//

import Foundation

struct Movie{
    let movieId: Int
//    let genre: [Genre]
    let movieName: String
    let movieDirector: String
}

extension Movie:Decodable{
    enum CodingKeys: String, CodingKey{
        case movieId = "id"
        case movieName = "name"
        case movieDirector = "director"
    }
    
    init(from decoder: Decoder) throws{
        let container = try decoder.container(keyedBy: CodingKeys.self)
        movieId = try container.decode(Int.self, forKey: .movieId)
        movieName = try container.decode(String.self, forKey: .movieName)
        movieDirector = try container.decode(String.self, forKey: .movieDirector)
    }
}
