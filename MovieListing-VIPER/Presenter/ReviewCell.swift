//
//  ReviewCell.swift
//  MovieListing-VIPER
//
//  Created by Audrey Aurelia Chang on 06/09/22.
//

import UIKit

class ReviewCell: UITableViewCell {

    @IBOutlet weak var reviewAuthor: UILabel!
    @IBOutlet weak var reviewContent: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
