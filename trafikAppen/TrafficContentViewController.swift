//
//  TrafficContentViewController.swift
//  trafikAppen
//
//  Created by Ceonn Bobst on 18/09/16.
//  Copyright © 2016 Ceonn Bobst. All rights reserved.
//

import UIKit
import Foundation
import Scrollable
import Social

class TrafficContentViewController: UIViewController {
    
    var item : RssItem!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentTitleLabel: UILabel!
    @IBOutlet weak var contentPubDateLabel: UILabel!
    @IBOutlet weak var contentDescriptionLabel: UILabel!
    
//    // Structs
//    struct RssItem {
//        var title: String = ""
//        var description: String = ""
//        var pubDate: String = ""
//    }
//    
//    var rssItem = RssItem()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Scroll View setup
        Scrollable.createContentView(scrollView)

        
        // Update UI
        contentTitleLabel.text = item.title
        print(item.title)
        contentPubDateLabel.text = item.pubDate
        contentDescriptionLabel.text = item.description
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation

}
