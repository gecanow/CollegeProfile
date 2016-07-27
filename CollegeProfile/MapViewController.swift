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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.text = college.name
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        let geocoder = CLGeocoder()
        
        geocoder.geocodeAddressString(textField.text!) { (placemarks, error) in
            if error != nil {
                // do nothing
            } else {
                let placemark = placemarks!.first as CLPlacemark!
                let center = placemark.location?.coordinate
                let span = MKCoordinateSpanMake(0.01, 0.01)
                
                self.displayMap(center!, span: span, pinTitle: self.college.name)
            }
        }
        
        textField.resignFirstResponder()
        return true
    }
    
    func displayMap(center: CLLocationCoordinate2D, span: MKCoordinateSpan, pinTitle: String) {
        
        let region = MKCoordinateRegionMake(center, span)
        
        let pin = MKPointAnnotation()
        pin.coordinate = center
        pin.title = pinTitle
        
        mapView.addAnnotation(pin)
        mapView.setRegion(region, animated: true)
    }
}
