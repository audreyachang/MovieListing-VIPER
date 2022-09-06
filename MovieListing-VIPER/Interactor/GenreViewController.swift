//
//  GenreViewController.swift
//  MovieListing-VIPER
//
//  Created by Audrey Aurelia Chang on 04/09/22.
//

import UIKit


class GenreViewController: UIViewController {
    //MARK: Outlet and variable declaration
    @IBOutlet weak var genreListTable: UITableView!
    var genreData: [Genre]? {
        didSet{
            DispatchQueue.main.async { [self] in
                genreListTable.reloadData()
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK: Call view setup function and retrieve needed data
        setup()
        let genreManager = GenreManager()

        genreManager.fetchGenre { (genres) in
            self.genreData = genres.genres
        }

        genreListTable.dataSource = self
        genreListTable.delegate = self
    }

}

//MARK: Navigation Logic
extension GenreViewController{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigateToMovieList(genreId: genreData![indexPath.row])
    }
    
}
