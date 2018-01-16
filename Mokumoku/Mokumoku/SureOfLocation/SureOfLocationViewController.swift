//
//  SureOfLocationViewController.swift
//  Mokumoku
//
//  Created by 野崎勇樹 on 2017/11/03.
//  Copyright © 2017年 野崎勇樹. All rights reserved.
//

import UIKit
import CoreLocation

class SureOfLocationViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var label: UILabel!
    var locationManager: CLLocationManager!
    var location: CLLocation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLocation()
    }
    
    func setupLocation() {
        locationManager = CLLocationManager()
        guard let locationManager = locationManager else {return}
        locationManager.requestAlwaysAuthorization()// 位置情報の条件分岐を行うには？
        locationManager.requestWhenInUseAuthorization()
        let status = CLLocationManager.authorizationStatus()
        if status == .authorizedWhenInUse {
            locationManager.delegate = self
            locationManager.distanceFilter = 10
            locationManager.startUpdatingLocation()
        }
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first
        let latitude = location?.coordinate.latitude
        let longitude = location?.coordinate.longitude
        
        print("latitude: \(latitude), longitude: \(longitude)")
    }
    
    @IBAction func clickButton(_ sender: Any) {
        guard let coorinatePointLabel = label else { return }
        let latitude = location?.coordinate.latitude
        let longitude = location?.coordinate.longitude
        coorinatePointLabel.text = String.init(describing: "latitude: \(latitude), longitude: \(longitude)")
    }
    
}
