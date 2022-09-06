//
//  MovieListRouter.swift
//  MovieListing-VIPER
//
//  Created by Audrey Aurelia Chang on 04/09/22.
//

import UIKit

//MARK: Navigation Logic for Movie List
extension MovieListViewController{
    func navigateToDetail(movieId: Int, currentMovie: Movie){
        let storyboard = UIStoryboard(name: "MovieDetailViewController", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "MovieDetailViewController")as! MovieDetailViewController
        vc.movieId = movieId
        vc.currentMovie = currentMovie
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
