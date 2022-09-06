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
    
    var reviewData: [Review]?
    var moviesData: [Movie]?
    var movieData: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        let genreManager = GenreManager()
        let reviewManager = ReviewManager()
        let movieDetailManager = MovieDetailManager()
        
        movieDetailManager.fetchMovie(movieId: 19) { (movie) in
            self.movieData = movie
        }
        reviewManager.fetchReviews(reviewId: 19){(reviews) in
            self.reviewData = reviews.reviews
        }

        genreManager.fetchGenre { (genres) in
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
        navigateToMovieList(genreId: genreData![indexPath.row])
    }
    
}
