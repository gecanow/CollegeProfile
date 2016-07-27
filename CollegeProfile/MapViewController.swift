//
//  MapViewController.swift
//  CollegeProfile
//
//  Created by Gaby Ecanow on 7/27/16.
//  Copyright © 2016 Gaby Ecanow. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var textField: UITextField!
    
    var college : College!
    var center = CLLocationCoordinate2D(latitude: 41.8939, longitude: -87.6354)
    
    //============================================
    // VIEW DID LOAD FUNCTION
    //============================================
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.text = college.name
    }
    
    //============================================
    // Handles turning the textfield text into
    // a coordinate
    //============================================
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        let geocoder = CLGeocoder()
        
        geocoder.geocodeAddressString(textField.text!) { (placemarks, error) in
            if error != nil {
                // do nothing
            } else {
                self.displayActionSheet(placemarks!)
            }
        }
        
        textField.resignFirstResponder()
        return true
    }
    
    //============================================
    // Handles displaying the action sheets
    // using the options that were returned by
    // the geocoder
    //============================================
    func displayActionSheet(options: [CLPlacemark]) {
        let span = MKCoordinateSpanMake(0.01, 0.01)
        
        let actionController = UIAlertController(title: "Locations", message: "Select a location", preferredStyle: UIAlertControllerStyle.ActionSheet)
        
        for option in options {
            let chooseLocationAction = UIAlertAction(title: option.name , style: .Default, handler: { (Void) in
                
                let center = option.location?.coordinate
                self.displayMap(center!, span: span, pinTitle: option.name!)
            })
            actionController.addAction(chooseLocationAction)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        actionController.addAction(cancelAction)
        
        self.presentViewController(actionController, animated: true, completion: nil)
        
    }
    
    //============================================
    // Displays the map with a pin at the center
    //============================================
    func displayMap(center: CLLocationCoordinate2D, span: MKCoordinateSpan, pinTitle: String) {
        
        let region = MKCoordinateRegionMake(center, span)
        
        let pin = MKPointAnnotation()
        pin.coordinate = center
        pin.title = pinTitle
        
        mapView.addAnnotation(pin)
        mapView.setRegion(region, animated: true)
    }
}
