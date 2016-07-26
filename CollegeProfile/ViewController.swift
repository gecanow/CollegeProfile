//
//  ViewController.swift
//  CollegeProfile
//
//  Created by Gaby Ecanow on 7/25/16.
//  Copyright © 2016 Gaby Ecanow. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var colleges = ["Northwestern", "Wash U", "UIC"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

