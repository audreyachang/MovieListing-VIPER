//
//  ReviewEntity.swift
//  MovieListing-VIPER
//
//  Created by Audrey Aurelia Chang on 05/09/22.
//

import Foundation

struct Review{
    let author: String
    let content: String
}

extension Review: Decodable{
    enum CodingKeys: String, CodingKey{
        case author = "author"
        case content = "content"
    }
    
    init(from decoder: Decoder) throws{
        let container = try decoder.container(keyedBy: CodingKeys.self)
        author = try container.decode(String.self, forKey: .author)
        content = try container.decode(String.self, forKey: .content)
    }
    
}

struct Reviews{
    let reviewId: Int
    let reviews: [Review]?
}

extension Reviews: Decodable{
    enum CodingKeys: String, CodingKey{
        case reviewId = "id"
        case reviews = "results"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        reviewId = try container.decode(Int.self, forKey: .reviewId)
        reviews = try container.decodeIfPresent([Review].self, forKey: .reviews)
    }
}
