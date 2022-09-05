//
//  GenreRouter.swift
//  MovieListing-VIPER
//
//  Created by Audrey Aurelia Chang on 04/09/22.
//

import UIKit

extension GenreViewController{
    func navigateToMovieList(genreId: Genre){
        let storyboard = UIStoryboard(name: "MovieListController", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "MovieListController")as! MovieListViewController
        vc.genreId = genreId
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
