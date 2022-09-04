//
//  GenrePresenter.swift
//  MovieListing-VIPER
//
//  Created by Audrey Aurelia Chang on 04/09/22.
//

import UIKit

extension GenreViewController{
    func setup(){
        self.title = "Genre"
        self.navigationItem.backButtonTitle = "Genres"
    }
}

extension GenreViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = genreListTable.dequeueReusableCell(withIdentifier: "GenreCell")!as UITableViewCell
        return cell
    }
}
