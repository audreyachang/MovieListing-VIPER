//
//  MovieAPI.swift
//  MovieListing-VIPER
//
//  Created by Audrey Aurelia Chang on 04/09/22.
//

import UIKit

//MARK: Function to fetch Genre data from API
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

//MARK: Function to fetch Movies by Genre from API
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
                    completion(moviesData)
                }
                catch
                {
                    print("Unable to decode movie data")
                }
            }.resume()
    }
}

//MARK: Function to fetch Movie data from API
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
                
                completion(movieDetail)
            }
            catch{
                print("Unable to decode movie data")
            }
        }.resume()
    }
}

//MARK: Function to fetch Reviews from API
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

//MARK: Function to fetch trailer key from API
struct MovieTrailerManager{
    func fetchTrailer(movieId:Int, completion: @escaping(MovieTrailers)->Void){
        guard let url = URL(string: movieURL+"movie/\(String(movieId))/videos?"+apiKey+"&"+language) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("Failed to retrieve trailer: \(error.localizedDescription)")
            }
            
            guard let jsonData = data else { return }
            
            let decoder = JSONDecoder()
            
            do{
                let trailerData = try decoder.decode(MovieTrailers.self, from: jsonData)
                completion(trailerData)
            }
            catch{
             print("Unable to decode data")
            }
        }.resume()
    }
}



