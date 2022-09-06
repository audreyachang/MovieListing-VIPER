//
//  MovieAPI.swift
//  MovieListing-VIPER
//
//  Created by Audrey Aurelia Chang on 04/09/22.
//

import UIKit

struct GenreManager{
    func fetchGenre(completion: @escaping(Genres)->Void){
        guard let url = URL(string: movieURL+"genre/movie/list?"+apiKey+"&"+language) else {return}
        
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

struct MovieListManager{
    func getMovieList(genreId:Int, completion: @escaping(Movies)->Void){
        guard let url = URL(string: movieURL+"discover/movie?"+apiKey+"&"+language+"&sort_by=popularity.desc&with_genres="+String(genreId)+"&with_watch_monetization_types=flatrate") else { return }
    
    URLSession.shared
            .dataTask(with: url) { data, _, error in
                if let error = error {
                    print("Unable to get data \(error.localizedDescription)")
                }
                
                guard let jsonData = data else {return}
                print(jsonData)
                let decoder = JSONDecoder()
                
                do {
                    let moviesData = try decoder.decode(Movies.self, from: jsonData)
                    print(moviesData)
                    completion(moviesData)
                }
                catch
                {
                    print("Unable to decode movie data")
                }
            }.resume()
    }
}

struct MovieDetailManager{
    func fetchMovie(movieId: Int, completion: @escaping(Movie)->Void){
        guard let url = URL(string: movieURL+"/movie/"+String(movieId)+"?"+apiKey+"&"+language) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("Unable to retrieve movie data: \(error.localizedDescription)")
            }
            
            guard let jsonData = data else { return }
            print(jsonData)
            
            let decoder = JSONDecoder()
            
            do{
                let movieDetail = try decoder.decode(Movie.self, from: jsonData)
                print(movieDetail
                )
                completion(movieDetail)
            }
            catch{
                print("Unable to decode movie data")
            }
        }.resume()
    }
}

struct ReviewManager{
    func fetchReviews(reviewId: Int,completion: @escaping(Reviews)->Void){
        guard let url = URL(string: movieURL+"movie/\(String(reviewId))/reviews?"+apiKey+"&"+language) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("Unable to retrieve reviews: \(error.localizedDescription)")
            }
            
            guard let jsonData = data else { return }
            
            let decoder = JSONDecoder()
            
            do{
                let reviewData = try decoder.decode(Reviews.self, from: jsonData)
                completion(reviewData)
            }
            catch{
                print("Unable to decode review data")
            }
        }.resume()
    }
}

