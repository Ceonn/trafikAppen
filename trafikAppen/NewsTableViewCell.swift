//
//  NewsTableViewCell.swift
//  trafikAppen
//
//  Created by Ceonn Bobst on 17/09/16.
//  Copyright © 2016 Ceonn Bobst. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    
    var item: RssItem! {
        didSet{
            updateUI()
        }
    }
    

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var pubTimeLabel: UILabel!
    @IBOutlet weak var postDescriptionLabel: UILabel!
    
    
    fileprivate func updateUI() {
        self.titleLabel.text = self.item.title
        self.pubTimeLabel.text = self.item.pubDate
        self.postDescriptionLabel.text = self.item.description
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    

}
