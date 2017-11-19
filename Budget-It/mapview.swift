//
//  ViewController.swift
//  jack
//
//  Created by Jackie Yan on 2017-11-18.
//  Copyright © 2017 Jackie Yan. All rights reserved.
//



import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    //Map
    
    @IBOutlet weak var map: MKMapView!
    
    let locationManager = CLLocationManager()
    // draw circle
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let circleRenderer = MKCircleRenderer(overlay: overlay)
        circleRenderer.strokeColor = UIColor.red
        circleRenderer.lineWidth = 1.0
        return circleRenderer
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // setup locationManager
        
        locationManager.delegate = self
        locationManager.distanceFilter = kCLLocationAccuracyNearestTenMeters
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        
        // setup map
        
        self.map.delegate = self
        self.map.showsUserLocation = true
        self.map.userTrackingMode = .follow
        
        setupData()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if CLLocationManager.authorizationStatus() == .notDetermined {
            // status is not determined
            locationManager.requestAlwaysAuthorization()
        } else if CLLocationManager.authorizationStatus() == .denied {
            // authorization were denied
            showAlert("Location services were previously denied. Please enable location services for this app in Settings.")
        } else if CLLocationManager.authorizationStatus() == .authorizedAlways {
            // we do have authorization
            locationManager.startUpdatingLocation()
        }
        
    }
    
    func setupData() {
        // check if system can monitor regions
        if CLLocationManager.isMonitoringAvailable(for: CLCircularRegion.self) {
            
            // region data
            let title = "Franks funhouse"
            let coordinate = CLLocationCoordinate2DMake(37.703026, -121.759735)
            let regionRadius = 100.0
            
            // setup region
            let region = CLCircularRegion(center: CLLocationCoordinate2D(latitude: coordinate.latitude,
                                                                         longitude: coordinate.longitude), radius: regionRadius, identifier: title)
            locationManager.startMonitoring(for: region)
            
            // setup annotation
            let restaurantAnnotation = MKPointAnnotation()
            restaurantAnnotation.coordinate = coordinate;
            restaurantAnnotation.title = "\(title)";
            map.addAnnotation(restaurantAnnotation)
            
            // setup circle
            let circle = MKCircle(center: coordinate, radius: regionRadius)
            map.add(circle)
        }
        else {
            print("System can't track regions")
        }
    }
    
    //problem
    var entrytime = NSDate()
    var entered = false
    //var monitoredRegions: Dictionary<String, NSDate> = [:]
    
    
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        showAlert("enter \(region.identifier)")
        //add entrance time
        if (entered == false) {
            entrytime = NSDate()
        }
        entered = true
    }
    
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        showAlert("exit \(region.identifier)")
        
        //remove entrance time
        //updateRegions()
        entered = false
        
    }
    
    //updates regularly
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if (entered == true) {
            updateRegions()
        }
    }
    
    //checks if user has been in proximity for x period of time
    func updateRegions() {
        let regionMaxVisiting = 3.0
        if NSDate().timeIntervalSince(entrytime as Date) > regionMaxVisiting {
            showAlert("You've been in this area for 3 seconds")
            entered = false
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    //show alert
    func showAlert(_ title: String) {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
}

