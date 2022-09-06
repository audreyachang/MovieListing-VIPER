//
//  MovieDetailPresenter.swift
//  MovieListing-VIPER
//
//  Created by Audrey Aurelia Chang on 04/09/22.
//

import UIKit

extension MovieDetailViewController{
    func setup(){
        self.title = currentMovie?.movieTitle
        self.movieTitle.text = currentMovie?.movieTitle
        self.movieDate.text = "Starts airing on:\n"
        self.movieDate.text! += dateFormatter(date: currentMovie!.releaseDate)
        self.movieProduction.text = "Movie Synopsis: \n"
        self.movieProduction.text! += currentMovie?.movieSummary ?? ""
        self.moviePoster.loadImage(url: URL(string: imageBase+currentMovie!.moviePoster)!)
        self.reviewLabel.text = "Movie Reviews"
        self.trailerButton.layer.cornerRadius = 15
        self.emptyReviews.isHidden = true
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
