//
//  MovieDetailViewController.swift
//  MovieListing-VIPER
//
//  Created by Audrey Aurelia Chang on 04/09/22.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    @IBOutlet weak var moviePoster: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieDate: UILabel!
    @IBOutlet weak var movieProduction: UILabel!
    @IBOutlet weak var trailerButton: UIButton!
    @IBOutlet weak var reviewTable: UITableView!
    
    var movieId: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        reviewTable.dataSource = self
        reviewTable.delegate = self
        print("This movie is \(movieId)")
        // Do any additional setup after loading the view.
    }
    



}

extension MovieDetailViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = reviewTable.dequeueReusableCell(withIdentifier: "reviewCell")! as UITableViewCell
        return cell
    }
    
    
}
