//
//  NewsTableViewCell.swift
//  trafikAppen
//
//  Created by Ceonn Bobst on 17/09/16.
//  Copyright © 2016 Ceonn Bobst. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var pubTimeLabel: UILabel!
    @IBOutlet weak var postDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
