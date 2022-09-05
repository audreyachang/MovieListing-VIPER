//
//  MovieAPI.swift
//  MovieListing-VIPER
//
//  Created by Audrey Aurelia Chang on 04/09/22.
//

import UIKit

struct GenreManager{
    func fetchGenre(completion: @escaping(Genres)->Void){
        guard let url = URL(string: movieURL+"genre/movie/list?api_key=d6c9ce3a708d644c2a256a1e16f76c52&language=en-US") else {return}
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("Unable to fetch genre data: \(error.localizedDescription)")
            }
            guard let jsonData = data else {return}
            
            let decoder = JSONDecoder()
            
            do{
                let genreData = try decoder.decode(Genres.self, from: jsonData)
                completion(genreData)
            }
            catch{
                print("Unable to decode data")
            }
            
        }.resume()
    }
}

func getMovieList(from url: String){
    
}

func getMovieDetail(from url: String){
    
}

struct ReviewManager{
    func fetchReviews(completion: @escaping(Reviews)->Void){
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/19/reviews?api_key=d6c9ce3a708d644c2a256a1e16f76c52&language=en-US") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("Unable to retrieve reviews: \(error.localizedDescription)")
            }
            
            guard let jsonData = data else { return }
            print(jsonData)
            
            let decoder = JSONDecoder()
            
            do{
                let reviewData = try decoder.decode(Reviews.self, from: jsonData)
                print(reviewData)
                completion(reviewData)
            }
            catch{
                print("Unable to decode review data")
            }
        }.resume()
    }
}

