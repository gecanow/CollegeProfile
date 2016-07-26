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
    var colleges = ["Northwestern", "Harvard", "MIT"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colleges.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MyCell", forIndexPath: indexPath)
        cell.textLabel?.text = colleges[indexPath.row]
        return cell
    }
    
}

