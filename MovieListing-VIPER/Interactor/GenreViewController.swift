//
//  GenreViewController.swift
//  MovieListing-VIPER
//
//  Created by Audrey Aurelia Chang on 04/09/22.
//

import UIKit


class GenreViewController: UIViewController {

    @IBOutlet weak var genreListTable: UITableView!
    var genreData: [Genre]? {
        didSet{
            print("Genres are available")
            DispatchQueue.main.async { [self] in
                genreListTable.reloadData()
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        let genreManager = GenreManager()

        genreManager.fetchGenre { (genres) in
            self.genreData = genres.genres
        }

        genreListTable.dataSource = self
        genreListTable.delegate = self
    }

}

extension GenreViewController{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigateToMovieList(genreId: genreData![indexPath.row])
    }
    
}
