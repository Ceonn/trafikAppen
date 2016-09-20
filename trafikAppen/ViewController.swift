//
//  ViewController.swift
//  trafikAppen
//
//  Created by Ceonn Bobst on 17/09/16.
//  Copyright © 2016 Ceonn Bobst. All rights reserved.
//

import UIKit
import GoogleMobileAds

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MenuTransitionManagerDelegate {
    
    // IBOutlet
    @IBOutlet var tableView: UITableView!
    @IBOutlet weak var bannerView: GADBannerView!
    
    // Variables
    private var rssItems:[(title: String, description: String, pubDate: String)]?
    
    let menuTransitionManager = MenuTransitionManager()
    
    // Functions
    func dismiss() {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Search setup
        self.hideKeyboardWhenTappedAround()
        
        // Table view setup
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 155.0
        
        // Parser setup
        let feedParser = FeedParser()
        feedParser.parseFeed(feedUrl: "http://www.apple.com/pr/feeds/pr.rss", completionHandler: { (rssItems: [(title: String, description: String, pubDate: String)]) -> Void in
            
            self.rssItems = rssItems
            OperationQueue.main.addOperation({ () -> Void in
                self.tableView.reloadSections(NSIndexSet(index: 0) as IndexSet, with: .none)
            })
        })
        
        // AdMob setup
        print("Google Mobile Ads SDK version: " + GADRequest.sdkVersion())
        bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        
    }
    
    // MARK: - Segues
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let trafficController = TrafficContentViewController()
    
        let myData = rssItems?[indexPath.row]
        performSegue(withIdentifier: "showContentSegue", sender: myData)
        
        trafficController.contentTitleLabel.text = myData?.title
        trafficController.contentPubDateLabel.text = myData?.pubDate
        trafficController.contentDescriptionLabel.text = myData?.description
        
    }
    
    // Mark: - Table View
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        
        guard let rssItems = rssItems else {
            return 0
        }
        
        return rssItems.count
 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as! NewsTableViewCell
        
        // Configure the cell...
        if let item = rssItems?[indexPath.row] {
            cell.titleLabel.text = item.title
            cell.postDescriptionLabel.text = item.description
            cell.pubTimeLabel.text = item.pubDate
        }
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        // Define the initial state (Before the animation)
        let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, 500, 0, 0)
        cell.layer.transform = rotationTransform
        // Define the final state (After the animation)
        UIView.animate(withDuration: 0.8, animations: { cell.layer.transform =
            CATransform3DIdentity })
        
    }
    
    // MARK: - Navigation
    @IBAction func unwindToHome(segue: UIStoryboardSegue) {
        let sourceController = segue.source as! MenuTableViewController
        self.title = sourceController.currentItem
    }
    
    func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let menuTableViewController = segue.destination as!
        MenuTableViewController
        menuTableViewController.currentItem = self.title!
        menuTableViewController.transitioningDelegate = menuTransitionManager
        menuTransitionManager.delegate = self
    }
    
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}
