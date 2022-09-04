//
//  MovieListViewController.swift
//  MovieListing-VIPER
//
//  Created by Audrey Aurelia Chang on 04/09/22.
//

import UIKit

class MovieListViewController: UIViewController {

    @IBOutlet weak var movieListTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        movieListTable.delegate = self
        movieListTable.dataSource = self
        print("This is the movie list page")
    }
    

   
}
