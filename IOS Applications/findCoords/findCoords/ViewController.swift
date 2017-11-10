//
//  ViewController.swift
//  findCoords
//
//  Created by Anna on 11/8/17.
//  Copyright © 2017 M a t t h e w. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var long: UILabel!
    @IBOutlet weak var lat: UILabel!
    
    
    var locationManager: CLLocationManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager = CLLocationManager()
        
        if let manager = locationManager {
            print("We have a manager")
            manager.delegate = self
            manager.requestAlwaysAuthorization()
            manager.requestLocation()
            manager.startUpdatingLocation()
        } else {
            print("no manager")
        }

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locations.forEach({
            location in
            
            lat.text = String(location.coordinate.latitude)
            long.text = String(location.coordinate.longitude)
            print(location)
        })
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("we got an error")
    }
    


}

