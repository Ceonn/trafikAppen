//
//  RssItem.swift
//  trafikAppen
//
//  Created by Arthur Loo on 26-09-16.
//  Copyright © 2016 Ceonn Bobst. All rights reserved.
//

import Foundation


class RssItem {
    
    
    //MARK:- Public API
    var title = ""
    var description = ""
    var pubDate = ""
    
    
    init(title: String, desc: String, pubDate: String) {
        self.title = title
        self.description = desc
        self.pubDate = pubDate
    }
    
    
    
    static func createData() -> [RssItem] {
        
        return[
            RssItem(title: "macOS Sierra Now Availaable as a Free Update", desc: "Cupertine blabal and some bull as a description", pubDate: "Tue, 20 Sep 2016 17:00:00"),
            RssItem(title: "Swift PLaygrounds Now Available on the App Store", desc: "CUPERTINO: A new app is available for playgrounds and some stuff, what is this actually, will google afterwards", pubDate: "Tue 13 Sep 2016 17:00"),
            RssItem(title: "Apple Introduces iPhone & & iPhone 7 Plus", desc: "After the grand fiasco of the iPhone 6S and 6SPlus apple tried to exceed the dissapointment of the crowd by introducing a number 7 thing.", pubDate: "01 jan 2014 23:59")
        
        ]
        
    }
    
    
    
    
    
    
    
}
