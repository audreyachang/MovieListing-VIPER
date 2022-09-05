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
    var genreData: [Genre]? {
        didSet{
            print("Genres are available")
            DispatchQueue.main.async { [self] in
                genreListTable.reloadData()
            }
        }
    }
    
    var reviewData: [Review]?
    var moviesData: [Movie]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        let genreManager = GenreManager()
        let reviewManager = ReviewManager()
        let movieListManager = MovieListManager()
        
        reviewManager.fetchReviews{(reviews) in
            self.reviewData = reviews.reviews
        }
        
        genreManager.fetchGenre { (genres) in
            self.genreData = genres.genres
        }
        
        movieListManager.getMovieList { (movies) in
            self.moviesData = movies.movies
        }
        
        genreListTable.dataSource = self
        genreListTable.delegate = self
        print("This is the Genre Page")
        // Do any additional setup after loading the view.
    }

}

extension GenreViewController{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigateToMovieList(genreId: genreData![indexPath.row])
    }
    
}
