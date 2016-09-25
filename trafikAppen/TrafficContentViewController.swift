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
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentTitleLabel: UILabel!
    @IBOutlet weak var contentPubDateLabel: UILabel!
    @IBOutlet weak var contentDescriptionLabel: UILabel!
    
    // Structs
    struct RssItem {
        var title: String = ""
        var description: String = ""
        var pubDate: String = ""
    }
    
    var rssItem = RssItem()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Scroll View setup
        Scrollable.createContentView(scrollView)

        
        // Update UI
        contentTitleLabel.text = rssItem.title
        print(rssItem.title)
        contentPubDateLabel.text = "2016-09-24"
        contentDescriptionLabel.text = "Lorem ipsum Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce molestie dolor ac nunc venenatis, semper maximus metus mattis. Suspendisse suscipit felis nec nisl vestibulum, a consectetur dolor feugiat. Cras at aliquam magna. Duis vehicula, metus at vestibulum suscipit, quam ex auctor tellus, at pharetra arcu sem eu ex. Pellentesque sit amet pulvinar sapien. Nunc imperdiet sapien ac ipsum interdum lobortis. Phasellus quis leo quis velit luctus semper vel nec sem. Curabitur tincidunt massa non scelerisque luctus. Curabitur mattis ipsum ligula, a ornare leo commodo nec. Aliquam at leo in massa mollis tristique. Proin ac gravida nibh. Duis lacinia metus in sagittis consectetur. Vestibulum suscipit convallis nisl et fringilla. Sed congue sodales neque, sed viverra nisl tincidunt ac."
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation

}
