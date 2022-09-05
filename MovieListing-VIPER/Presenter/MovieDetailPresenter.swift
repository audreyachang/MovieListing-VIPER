//
//  MovieDetailPresenter.swift
//  MovieListing-VIPER
//
//  Created by Audrey Aurelia Chang on 04/09/22.
//

import UIKit

extension MovieDetailViewController{
    func setup(){
        self.title = "Movie Detail"
        print("Welcome to the detail page")
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionHeader = UIView.init(frame: CGRect.init(x: 0, y: 0, width: reviewTable.frame.width, height: 20))
        
        let titleLabel = UILabel()
        titleLabel.frame = CGRect.init(x: 8, y: 0, width: sectionHeader.frame.width-8, height: 16)
        titleLabel.text = "Reviews"
        titleLabel.font = .systemFont(ofSize: 16)
        titleLabel.textColor = .black
        
        sectionHeader.addSubview(titleLabel)
        return sectionHeader
    }
}
