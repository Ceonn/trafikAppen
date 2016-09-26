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
    
    var items = [RssItem]()
    
    let menuTransitionManager = MenuTransitionManager()
    
    // Functions
    func dismiss() {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.items = RssItem.createData()
        
        // Table view setup
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 155.0
        tableView.delaysContentTouches = false
        
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
    
    /*
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        _ = tableView.indexPathForSelectedRow!
        if let _ = tableView.cellForRow(at: indexPath) {
        let myData = rssItems?[indexPath.row]
        performSegue(withIdentifier: "showContentSegue", sender: myData)
        }
    }
    
    func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let menuTableViewController = segue.destination as!
        MenuTableViewController
        menuTableViewController.currentItem = self.title!
        menuTableViewController.transitioningDelegate = menuTransitionManager
        menuTransitionManager.delegate = self
        
        if segue.identifier == "showContentSegue" {
            if let dest: TrafficContentViewController = segue.destination as? TrafficContentViewController {
            let rssItem = sender as? TrafficContentViewController.RssItem
            dest.rssItem = rssItem!
            }
        }
    }
    //  */
    
    //*
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "showContentSegue", sender: self.items[(indexPath as NSIndexPath).row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showContentSegue" {
            let tcVC = segue.destination as! TrafficContentViewController
            tcVC.item = sender as! RssItem /*YOUR NEW MODEL */
        }
    }
//  */
    
    // Mark: - Table View
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        
//        guard let rssItems = rssItems else {
//            return 0
//        }
//        
//        return rssItems.count
 
        return self.items.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as! NewsTableViewCell
        
//        // Configure the cell...
//        if let item = rssItems?[indexPath.row] {
//            cell.titleLabel.text = item.title
//            cell.postDescriptionLabel.text = item.description
//            cell.pubTimeLabel.text = item.pubDate
//        }

        cell.item = self.items[(indexPath as NSIndexPath).row]
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
    func unwindToHome(segue: UIStoryboardSegue) {
        let sourceController = segue.source as! MenuTableViewController
        self.title = sourceController.currentItem
    }
    
}
