//
//  ViewController.swift
//  Maps
//
//  Created by 野崎勇樹 on 2017/12/29.
//  Copyright © 2017年 野崎勇樹. All rights reserved.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController, GMSMapViewDelegate, UIWebViewDelegate {

    var mapView: GMSMapView?
    var position = [CLLocationCoordinate2D]()
    var names = [String]()

    // APIから取ってきた緯度経度をcameraに設定し、ピンを設置する
    // ボタンをクリックすると、緯度経度が再設定される
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let camera = GMSCameraPosition.camera(withLatitude: 34.933357, longitude: 135.760289, zoom: 6.0)
        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        
        mapView?.isMyLocationEnabled = true
        view = mapView
        getInfo()
        mapView?.delegate = self
    }

    func mapView(_ mapView: GMSMapView, didTapInfoWindowOf marker: GMSMarker) {
        let coord = CLLocationCoordinate2DMake(34.933357, 135.760289)
        let panoView = GMSPanoramaView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height))
        panoView.moveNearCoordinate(coord)
        view.addSubview(panoView)
    }
    
    func createMarker() {
        for pos in position {
            let marker = GMSMarker(position: pos)
            marker.map = mapView
        }
//        marker.title = "Sydney"
//        marker.snippet = "Australia"
    }
    
    func mapView(_ mapView: GMSMapView, didLongPressInfoWindowOf marker: GMSMarker) {
        let myWebView = UIWebView()
        myWebView.delegate = self
        myWebView.frame = view.bounds
        view.addSubview(myWebView)
        
        let url = URL(fileURLWithPath: "http://jp.sydney.com")
        if UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                // Fallback on earlier versions
            }
        }
    }
    
    private func getInfo() {
        guard let urlGrnavi = URL(string: "https://api.gnavi.co.jp/RestSearchAPI/20150630/?keyid=d27e539fbe13dd562fc22dfcf5b04acc&format=json&areacode_m=AREAM2178") else {return}
        let task = URLSession.shared.dataTask(with: urlGrnavi, completionHandler: { data, response, error in
            do {
                guard let data = data else {return}
                if let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as? [String: Any] {
                    guard let rest = json["rest"] as? [[String: Any]] else {return}
                    for num in rest {
                        let latNumber = String(describing: num["latitude"]!)
                        let lonNumber = String(describing: num["longitude"]!)
                        let titleName = String(describing: num["name"]!)
                        guard let lat = Double(latNumber) else {return}
                        guard let lon = Double(lonNumber) else {return}
                        self.position.append(CLLocationCoordinate2D(latitude: lat, longitude: lon))
//                        print("latitude: \(latNumber), lontitude: \(lonNumber)")
                        print("title: \(titleName)")
                    }
//                    print("\(json)")
                }
                
                DispatchQueue.main.async {
                    self.createMarker()
                }
            }
            catch{
                print(error)
            }
        })
        task.resume()

    }
}

