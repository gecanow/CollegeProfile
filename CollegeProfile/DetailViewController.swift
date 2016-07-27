//
//  DetailViewController.swift
//  CollegeProfile
//
//  Created by Gaby Ecanow on 7/26/16.
//  Copyright © 2016 Gaby Ecanow. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var locationField: UITextField!
    @IBOutlet weak var enrollmentField: UITextField!
    @IBOutlet weak var imageField: UIImageView!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var websiteField: UITextField!
    
    var imagePicker = UIImagePickerController()
    
    var college : College!
    var urlStr = "https://www.google.com"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        
        nameField.text = college.name
        locationField.text = college.location
        enrollmentField.text = String(college.enrollment)
        imageField.image = college.image
        backgroundImage.image = college.image
        backgroundImage.alpha = 0.1
        websiteField.text = college.website
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        imagePicker.dismissViewControllerAnimated(true) { 
            let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            self.imageField.image = selectedImage
            self.backgroundImage.image = selectedImage
            self.backgroundImage.alpha = 0.1
        }
    }
    
    @IBAction func onTappedGoButton(sender: UIButton) {
        let url = NSURL(string: college.website)
        UIApplication.sharedApplication().openURL(url!)
    }
    
    @IBAction func onTappedLibrary(sender: UIButton) {
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func onTappedSave(sender: UIButton) {
        college.name = nameField.text!
        college.location = locationField.text!
        college.enrollment = Int(enrollmentField.text!)!
        college.image = imageField.image
        college.website = websiteField.text!
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let dvc = segue.destinationViewController as! MapViewController
        dvc.college = college
    }
}
