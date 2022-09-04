//
//  MovieAPI.swift
//  MovieListing-VIPER
//
//  Created by Audrey Aurelia Chang on 04/09/22.
//

import Foundation

func getGenres(from url: String){
    URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: {data, response, error in
        
        guard let data = data, error == nil else{
            print("Something went wrong")
            return
        }
        
        var genres: Genres?
        
        do{
            genres = try JSONDecoder().decode(Genres.self, from: data)
        }catch{
            print("Unable to convert data from JSON")
        }
        
        guard let jsonData = genres else {
            return
        }
        
        print(jsonData.genres)
        
    }).resume()
}

func getMovieList(from url: String){
    
}

func getMovieDetail(from url: String){
    
}
