//
//  GenreViewController.swift
//  MovieListing-VIPER
//
//  Created by Audrey Aurelia Chang on 04/09/22.
//

import UIKit

class GenreViewController: UIViewController {

    @IBOutlet weak var genreListTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        genreListTable.dataSource = self
        genreListTable.delegate = self
        print("This is the Genre Page")
        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension GenreViewController{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}
