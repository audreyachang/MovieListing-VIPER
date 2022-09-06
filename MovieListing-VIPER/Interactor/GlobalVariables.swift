//
//  GlobalVariables.swift
//  MovieListing-VIPER
//
//  Created by Audrey Aurelia Chang on 06/09/22.
//

import UIKit

//MARK: Publicly used variables for API call
public var movieURL = "https://api.themoviedb.org/3/"
public var apiKey = "api_key=d6c9ce3a708d644c2a256a1e16f76c52"
public var language = "language=en-US"
public var imageBase = "https://image.tmdb.org/t/p/w500/"

//MARK: Decode image data function
extension UIImageView {
    func loadImage(url: URL){
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url){
                if let image = UIImage(data: data){
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

//MARK: Function to convert Date String to another format
public func dateFormatter(date: String)->String{
    
    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale(identifier: "en_US_POSIX")
    dateFormatter.dateFormat = "yyyy-MM-dd"
    
    let newDateFormat = DateFormatter()
    newDateFormat.dateFormat = "MMM d, yyyy"
    
    let dateString = dateFormatter.date(from: date)
    let newDate = newDateFormat.string(from: dateString!)
    
    return newDate
}
