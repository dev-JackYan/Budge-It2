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
import UserNotifications

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
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge], completionHandler: {didAllow, error in  })
        
        let content = UNMutableNotificationContent()
        content.title = "Spendings Alert"
        content.body = "Remember your budget for _____ is $_____"
        content.badge = 1
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: "timerDone", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        
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
        print ("YOYOYOYYOYOYOYOYOYO")
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
            var title = "Franky's Hall of Sports"
            //need to specify type of expense
            var coordinate = CLLocationCoordinate2DMake(42.9988376, -81.2784611)
            var regionRadius = 5.0
            
            // setup region
            var region = CLCircularRegion(center: CLLocationCoordinate2D(latitude: coordinate.latitude,
                                                                         longitude: coordinate.longitude), radius: regionRadius, identifier: title)
            locationManager.startMonitoring(for: region)
            
            // setup annotation
            var restaurantAnnotation = MKPointAnnotation()
            restaurantAnnotation.coordinate = coordinate;
            restaurantAnnotation.title = "\(title)";
            map.addAnnotation(restaurantAnnotation)
            
            // setup circle
            var circle = MKCircle(center: coordinate, radius: regionRadius)
            map.add(circle)
            
            
            // region data
            title = "Zaggy's Tech-Palace"
            //need to specify type of expense
            coordinate = CLLocationCoordinate2DMake(43.000690, -81.276636)
            regionRadius = 40.0
            
            // setup region
            region = CLCircularRegion(center: CLLocationCoordinate2D(latitude: coordinate.latitude,
                                                                     longitude: coordinate.longitude), radius: regionRadius, identifier: title)
            locationManager.startMonitoring(for: region)
            
            // setup annotation
            restaurantAnnotation = MKPointAnnotation()
            restaurantAnnotation.coordinate = coordinate;
            restaurantAnnotation.title = "\(title)";
            map.addAnnotation(restaurantAnnotation)
            
            // setup circle
            circle = MKCircle(center: coordinate, radius: regionRadius)
            map.add(circle)
            
            
            // region data
            title = "Jack's Butchershop"
            //need to specify type of expense
            coordinate = CLLocationCoordinate2DMake(43.001594, -81.277124)
            regionRadius = 40.0
            
            // setup region
            region = CLCircularRegion(center: CLLocationCoordinate2D(latitude: coordinate.latitude,
                                                                     longitude: coordinate.longitude), radius: regionRadius, identifier: title)
            locationManager.startMonitoring(for: region)
            
            // setup annotation
            restaurantAnnotation = MKPointAnnotation()
            restaurantAnnotation.coordinate = coordinate;
            restaurantAnnotation.title = "\(title)";
            map.addAnnotation(restaurantAnnotation)
            
            // setup circle
            circle = MKCircle(center: coordinate, radius: regionRadius)
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
        //showAlert("enter \(region.identifier)")
        if (entered == false) {
            entrytime = NSDate()
        }
        entered = true
    }
    
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        //showAlert("exit \(region.identifier)")
        
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
        let regionMaxVisiting = 2.5
        if NSDate().timeIntervalSince(entrytime as Date) > regionMaxVisiting {
            showAlert("Remember your budget for _____ is $_____")
            entered = false
        }
        let content = UNMutableNotificationContent()
        content.subtitle = "Spendings Alert"
        content.body = "Remember your budget for _____ is $_____"
        content.badge = 1
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: "timerDone", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    //show alert
    func showAlert(_ title: String) {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    
}


