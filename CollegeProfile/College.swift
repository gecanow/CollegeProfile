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
    var image = UIImage(named: "default")
    
    convenience init(name: String, location: String, enrollment: Int, image: UIImage) {
        self.init()
        self.name = name
        self.location = location
        self.enrollment = enrollment
        self.image = image
    }
    
    convenience init(name: String) {
        self.init()
        self.name = name
    }
}
