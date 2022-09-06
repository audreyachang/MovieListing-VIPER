//
//  MovieDetailViewController.swift
//  MovieListing-VIPER
//
//  Created by Audrey Aurelia Chang on 04/09/22.
//

import UIKit
import AVKit
import AVFoundation

class MovieDetailViewController: UIViewController {
    
    @IBOutlet weak var moviePoster: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieDate: UILabel!
    @IBOutlet weak var movieProduction: UILabel!
    @IBOutlet weak var reviewLabel: UILabel!
    @IBOutlet weak var trailerButton: UIButton!
    @IBOutlet weak var reviewTable: UITableView!
    @IBOutlet weak var emptyReviews: UILabel!
    
    var trailerKey = ""
    var movieId: Int = 0
    var currentMovie: Movie?
    
    var reviewData: [Review]?{
        didSet{
            DispatchQueue.main.async { [self] in
                reviewTable.reloadData()
            }
        }
    }
    
    var movieTrailer: [MovieTrailer]?{
        didSet{
            print("Fetched trailer Data")
            if movieTrailer?.isEmpty == false{
                trailerKey = movieTrailer?[0].movieTrailerKey ?? ""}
        }
    }
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        reviewTable.dataSource = self
        reviewTable.delegate = self
        print("This movie is \(movieId)")
        
        let movieTrailerManager = MovieTrailerManager()
        let reviewManager = ReviewManager()
        
        movieTrailerManager.fetchTrailer(movieId: currentMovie!.movieId) { (trailer) in
            self.movieTrailer = trailer.movieTrailer
        }
        
        reviewManager.fetchReviews(reviewId: currentMovie!.movieId) { (reviews) in
            self.reviewData = reviews.reviews
           
        }
    }
    
    @IBAction func playTrailer(_ sender: UIButton) {
        if trailerKey != ""{
            if let url = URL(string: "https://www.youtube.com/watch?v=\(trailerKey)"){
                UIApplication.shared.open(url)
                }
        }else{
            let alert = UIAlertController(title: "No Trailers Available", message: "There are no trailers available for this movie", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}

extension MovieDetailViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if reviewData?.count == 0 {
            return 1
        }else{
            return reviewData?.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = reviewTable.dequeueReusableCell(withIdentifier: "reviewCell") as! ReviewCell
        if reviewData?.count == 0{
            emptyReviews.isHidden = false
            reviewTable.isHidden = true
            emptyReviews.text = "There are no reviews available for this movie"
            print("There are no reviews available")
        }else{
            emptyReviews.isHidden = true
            reviewTable.isHidden = false
            cell.reviewAuthor.text = reviewData?[indexPath.row].author ?? ""
            cell.reviewContent.text = reviewData?[indexPath.row].content ?? ""
        }
        return cell
    }
    
    
}
