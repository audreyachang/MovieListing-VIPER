//
//  GenreCell.swift
//  MovieListing-VIPER
//
//  Created by Audrey Aurelia Chang on 05/09/22.
//

import UIKit

class GenreCell: UITableViewCell {

    @IBOutlet weak var genreTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
