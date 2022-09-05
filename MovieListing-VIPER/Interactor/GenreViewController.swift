//
//  GenreViewController.swift
//  MovieListing-VIPER
//
//  Created by Audrey Aurelia Chang on 04/09/22.
//

import UIKit

public var movieURL = "https://api.themoviedb.org/3/"

class GenreViewController: UIViewController {

    @IBOutlet weak var genreListTable: UITableView!
    var genreData: [Genre] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        let genreManager = GenreManager()
        genreManager.fetchGenre { (genres) in
            print(genres)
            self.genreData = genres.genres
        }
        genreListTable.dataSource = self
        genreListTable.delegate = self
        print("This is the Genre Page")
        // Do any additional setup after loading the view.
    }

}

extension GenreViewController{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}
