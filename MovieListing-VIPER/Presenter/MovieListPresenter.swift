//
//  MovieListPresenter.swift
//  MovieListing-VIPER
//
//  Created by Audrey Aurelia Chang on 04/09/22.
//

import UIKit

extension MovieListViewController{
    func setupView(){
        self.title = "Movie List"
    }
}

extension MovieListViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = movieListTable.dequeueReusableCell(withIdentifier: "movieListCell")! as UITableViewCell
        return cell
    }
    
    
}
