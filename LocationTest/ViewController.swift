//
//  ViewController.swift
//  LocationTest
//
//  Created by Dang Pham on 3/30/15.
//  Copyright (c) 2015 Quartet. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var latLabel: UILabel!
    @IBOutlet weak var start: UIButton!
    var manager:CLLocationManager!
    var loggedLocations : [CLLocation] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        manager = CLLocationManager()
        manager.delegate = self
        manager.requestAlwaysAuthorization()
        manager.desiredAccuracy = kCLLocationAccuracyBest
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func startUpdate(sender: AnyObject) {
        print("Started")
        manager.startUpdatingLocation()
    }
    @IBAction func pausUpdate(sender: AnyObject) {
        manager.stopUpdatingLocation()
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations:[AnyObject]){
        println("logged")
        loggedLocations.append(locations[0] as CLLocation)
        latLabel.text = loggedLocations[loggedLocations.count-1].description
        println(loggedLocations[loggedLocations.count-1].description)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

