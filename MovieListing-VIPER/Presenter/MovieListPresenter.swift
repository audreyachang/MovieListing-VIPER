//
//  MovieListPresenter.swift
//  MovieListing-VIPER
//
//  Created by Audrey Aurelia Chang on 04/09/22.
//

import UIKit

extension MovieListViewController{
    //MARK: Movie List view set up function
    func setupView(){
        self.title = genreId?.genreName
        self.navigationItem.backButtonTitle = ""
    }
}

//MARK: Movie List Table Set Up
extension MovieListViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = movieListTable.dequeueReusableCell(withIdentifier: "movieListCell")as! MovieListCell
        let moviePoster = moviesData![indexPath.row].moviePoster
        cell.posterImage.loadImage(url: URL(string: "https://image.tmdb.org/t/p/w92/\(String(moviePoster))")!)
        cell.movieTitle.text = moviesData![indexPath.row].movieTitle
        cell.releaseDate.text = "Released on:" + "\n" + dateFormatter(date: moviesData![indexPath.row].releaseDate)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    
}


