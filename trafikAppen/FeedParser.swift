//
//  FeedParser.swift
//  trafikAppen
//
//  Created by Ceonn Bobst on 17/09/16.
//  Copyright © 2016 Ceonn Bobst. All rights reserved.
//

import UIKit

class FeedParser: NSObject, XMLParserDelegate {
    
    private var rssItems:[(title: String, description: String, pubDate: String)] = []
    private var currentElement = ""
    private var currentTitle:String = "" {
        didSet {
            currentTitle = currentTitle.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
        }
    }
    private var currentDescription:String = "" {
        didSet {
            currentDescription = currentDescription.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
        }
    }
    private var currentPubDate:String = "" {
        didSet {
            currentPubDate = currentPubDate.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
        }
    }
    private var parserCompletionHandler:(([(title: String, description: String, pubDate: String)]) -> Void)?
    
    func parseFeed(feedUrl: String, completionHandler: (([(title: String, description: String, pubDate: String)]) -> Void)?) -> Void {
        
        self.parserCompletionHandler = completionHandler
        
        let request = NSURLRequest(url: NSURL(string: feedUrl)! as URL)
        let urlSession = URLSession.shared
        let task = urlSession.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            
            guard let data = data else {
                if let error = error {
                    print(error)
                }
                return
            }
            
            // Parse XML data
            let parser = XMLParser(data: data)
            parser.delegate = self
            parser.parse()
            
        })
        
        task.resume()
    }
    
    func parserDidStartDocument(_ parser: XMLParser) {
        rssItems = []
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        
        currentElement = elementName
        
        if currentElement == "item" {
            currentTitle = ""
            currentDescription = ""
            currentPubDate = ""
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        
        switch currentElement {
        case "title": currentTitle += string
        case "description": currentDescription += string
        case "pubDate": currentPubDate += string
        default: break
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
        if elementName == "item" {
            let rssItem = (title: currentTitle, description: currentDescription, pubDate: currentPubDate)
            rssItems += [rssItem]
        }
    }
    
    func parserDidEndDocument(_ parser: XMLParser) {
        parserCompletionHandler?(rssItems)
    }
    
    func parser(_ parser: XMLParser, parseErrorOccurred parseError: Error) {
        print(parseError.localizedDescription)
    }
}













































