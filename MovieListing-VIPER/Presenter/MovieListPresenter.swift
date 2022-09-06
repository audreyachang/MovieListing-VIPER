//
//  MovieListPresenter.swift
//  MovieListing-VIPER
//
//  Created by Audrey Aurelia Chang on 04/09/22.
//

import UIKit

extension MovieListViewController{
    func setupView(){
        self.title = genreId?.genreName
    }
}

extension MovieListViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = movieListTable.dequeueReusableCell(withIdentifier: "movieListCell")as! MovieListCell
        cell.posterImage.loadImage(url: URL(string: "https://image.tmdb.org/t/p/w92/hUK9rewffKGqtXynH5SW3v9hzcu.jpg")!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    
}

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
