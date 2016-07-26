//
//  DetailViewController.swift
//  CollegeProfile
//
//  Created by Gaby Ecanow on 7/26/16.
//  Copyright © 2016 Gaby Ecanow. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var locationField: UITextField!
    @IBOutlet weak var enrollmentField: UITextField!
    @IBOutlet weak var imageField: UIImageView!
    var college : College!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameField.text = college.name
        locationField.text = college.location
        enrollmentField.text = String(college.enrollment)
        imageField.image = college.image
    }
    
    
    @IBAction func onTappedSave(sender: UIButton) {
        college.name = nameField.text!
        college.location = locationField.text!
        college.enrollment = Int(enrollmentField.text!)!
        college.image = imageField.image
    }
}
