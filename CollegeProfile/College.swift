//
//  College.swift
//  CollegeProfile
//
//  Created by Gaby Ecanow on 7/26/16.
//  Copyright © 2016 Gaby Ecanow. All rights reserved.
//

import UIKit

class College: NSObject {

    var name = ""
    var location = ""
    var enrollment = 0
    var website = "https://www.google.com"
    var image = UIImage(named: "Default")
    
    convenience init(name: String, location: String, enrollment: Int, image: UIImage, website: String) {
        self.init()
        self.name = name
        self.location = location
        self.enrollment = enrollment
        self.image = image
        self.website = website
    }
    
    convenience init(name: String) {
        self.init()
        self.name = name
    }
}
