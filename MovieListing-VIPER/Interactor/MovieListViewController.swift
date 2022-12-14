//
//  MovieListViewController.swift
//  MovieListing-VIPER
//
//  Created by Audrey Aurelia Chang on 04/09/22.
//

import UIKit

class MovieListViewController: UIViewController {
    //MARK: Outlet and variables declaration
    @IBOutlet weak var movieListTable: UITableView!
    
    var genreId: Genre?
    var moviesData: [Movie]?{
        didSet{
            DispatchQueue.main.async { [self] in
                movieListTable.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK: Call set up function for view + preparation for table and data retrieval
        setupView()
        movieListTable.delegate = self
        movieListTable.dataSource = self
        
        let movieListManager = MovieListManager()
        
        movieListManager.getMovieList(genreId: genreId!.genreId) { (movies) in
            self.moviesData = movies.movies
        }
    }
}

//MARK: Navigation function
extension MovieListViewController{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigateToDetail(movieId: indexPath.row, currentMovie: moviesData![indexPath.row])
    }
    
    
}
