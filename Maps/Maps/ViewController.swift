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

    // APIから取ってきた緯度経度をcameraに設定し、ピンを設置する
    // ボタンをクリックすると、緯度経度が再設定される
    // 使うAPIは、ぐるなびなので、取ってきた文字列をエンコードする必要がある
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let camera = GMSCameraPosition.camera(withLatitude: 34.933357, longitude: 135.760289, zoom: 6.0)
        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        
        mapView?.isMyLocationEnabled = true
        view = mapView
        getInfo()
//        createMarker()
        
        mapView?.delegate = self
    }

    func mapView(_ mapView: GMSMapView, didTapInfoWindowOf marker: GMSMarker) {
        let coord = CLLocationCoordinate2DMake(34.933357, 135.760289)
        let panoView = GMSPanoramaView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height))
        panoView.moveNearCoordinate(coord)
        view.addSubview(panoView)
    }
    
    func createMarker() {
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2DMake(34.933357, 135.760289)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = mapView
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
        guard let urlGrnavi = URL(string: "https://api.gnavi.co.jp/RestSearchAPI/20150630/?keyid=d27e539fbe13dd562fc22dfcf5b04acc&format=json&areacode_m=AREAM2178") else {return} //Dictionaryではなく、Array型にする必要がある
        let task = URLSession.shared.dataTask(with: urlGrnavi, completionHandler: { data, response, error in
            do {
                guard let data = data else {return}
                let json: NSDictionary = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
                let rest: NSArray = json["rest"] as! NSArray
                for num in rest {
                    var element = num as! NSDictionary
                    let number = element["latitude"]
//                    print("nums:: \(num)")
                    print("latitude: \(number)")
                }
//                print("restt: \(rest)")
                
                //                let shopName = rest["name"]
                //                let articles = json.map { article -> [String: Any]? in
                //                    return article as? [String: Any]
                //                }
                //                DispatchQueue.main.async() {() -> Void in
                //                    self.articles = articles
                //                }
                //                DispatchQueue.main.async() {() -> Void in
                //                    self.name = [shopName as! [String : Any]]
                //                }
                
//                print("\(json)")
            }
            catch{
                print(error)
            }
        })
        task.resume()

    }
}

