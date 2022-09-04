//
//  MovieListViewController.swift
//  MovieListing-VIPER
//
//  Created by Audrey Aurelia Chang on 04/09/22.
//

import UIKit

class MovieListViewController: UIViewController {

    @IBOutlet weak var movieListTable: UITableView!
    
    var genreId: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        movieListTable.delegate = self
        movieListTable.dataSource = self
        print("Directed from \(genreId)")
    }
}

extension MovieListViewController{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigateToDetail(movieId: indexPath.row)
    }
}
