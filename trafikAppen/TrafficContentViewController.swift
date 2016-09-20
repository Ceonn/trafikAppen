//
//  TrafficContentViewController.swift
//  trafikAppen
//
//  Created by Ceonn Bobst on 18/09/16.
//  Copyright © 2016 Ceonn Bobst. All rights reserved.
//

import UIKit

class TrafficContentViewController: UIViewController {
    
    @IBOutlet weak var contentTitleLabel: UILabel!
    @IBOutlet weak var contentPubDateLabel: UILabel!
    @IBOutlet weak var contentDescriptionLabel: UILabel!
    
    var contentTitle = String()
    var contentDescription = String()
    var contentPubDate = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentTitleLabel.text = contentTitle
        contentPubDateLabel.text = contentPubDate
        contentDescriptionLabel.text = contentDescription
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

}
