//
//  ArticleOverviewTableViewCell.swift
//  NewYorkTimesAPI
//
//  Created by Mingyong Zhu on 4/15/22.
//

import UIKit

class ArticleOverviewTableViewCell: UITableViewCell {

    @IBOutlet  weak var headline: UILabel!
    @IBOutlet  weak var abstract: UILabel!
    @IBOutlet  weak var webURL: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
