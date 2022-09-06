//
//  GenrePresenter.swift
//  MovieListing-VIPER
//
//  Created by Audrey Aurelia Chang on 04/09/22.
//

import UIKit

extension GenreViewController{
    //MARK: Set up function for Genre View Controller
    func setup(){
        self.title = "Genre"
        self.navigationItem.backButtonTitle = ""
    }
}

//MARK: Genre List Table Set Up
extension GenreViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return genreData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = genreListTable.dequeueReusableCell(withIdentifier: "GenreCell", for: indexPath)as! GenreCell
        cell.genreTitle.text = genreData![indexPath.row].genreName
        return cell
    }
}
