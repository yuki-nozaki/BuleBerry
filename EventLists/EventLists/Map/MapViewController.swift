//
//  ViewController.swift
//  Maps
//
//  Created by 野崎勇樹 on 2017/12/29.
//  Copyright © 2017年 野崎勇樹. All rights reserved.
//

import UIKit
import GoogleMaps
import WebKit

final class MapViewController: UIViewController {

    private var mapView: GMSMapView?
    private var names = [String]()
    private var fotterView = UIView()
    private var dismissButton = UIButton()
    
    private var latString = ""
    private var lngString = ""
    
    private var mapLat = 0.0
    private var mapLng = 0.0
    private var makerTitle = ""
    private var makerSubTitle = ""
    fileprivate var urlString = ""

    // APIから取ってきた緯度経度をcameraに設定し、ピンを設置する
    // ボタンをクリックすると、緯度経度が再設定される
    override func viewDidLoad() {
        super.viewDidLoad()
        // create Map
        guard let lat = Double(latString) else { return }
        self.mapLat = lat
        guard let lng = Double(lngString) else { return }
        self.mapLng = lng
        let camera = GMSCameraPosition.camera(withLatitude: mapLat, longitude: mapLng, zoom: 15.0)
        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView?.isMyLocationEnabled = true
        // マーカー設置
        let maker = GMSMarker()
        maker.position = CLLocationCoordinate2D(latitude: mapLat, longitude: mapLng)
        maker.title = makerTitle
        maker.snippet = makerSubTitle
        maker.map = mapView

        // 戻るボタン
        let dismissButtonRect = CGRect(x: self.view.frame.width / 5, y: self.view.frame.height * 3 / 4, width: self.view.frame.width / 7, height: self.view.frame.height / 9)
        dismissButton = UIButton(frame: dismissButtonRect)
        dismissButton.setTitle("戻る", for: .normal)
        dismissButton.addTarget(self, action: #selector(dismissMap), for: .touchUpInside)
        dismissButton.backgroundColor = .black
        dismissButton.setTitleColor(.white, for: .normal)

        view = mapView
        view.addSubview(dismissButton)
        getInfo()
        mapView?.delegate = self
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        mapLat = 0.0
        mapLng = 0.0
    }
    
    static func instantiate(event: Events) -> MapViewController {
        let vc = MapViewController()
        guard let lat = event.lat, lat != "" else { return vc }
        guard let lng = event.lng, lng != "" else { return vc }
        vc.latString = lat
        vc.lngString = lng
        vc.makerTitle = event.title
        vc.makerSubTitle = event.place
        guard let urlString = event.url else {
            return vc
        }
        vc.urlString = urlString
        return vc
    }
    
    @objc fileprivate func dismissMap() {
        self.dismiss(animated: true)
    }
    
    private func getInfo() {
        // ぐるなびAPI期限切れ
        guard let urlGrnavi = URL(string: "https://api.gnavi.co.jp/RestSearchAPI/20150630/?keyid=d27e539fbe13dd562fc22dfcf5b04acc&format=json&areacode_m=AREAM2178") else {return}
        let task = URLSession.shared.dataTask(with: urlGrnavi, completionHandler: { data, response, error in
            do {
                guard let data = data else {return}
                if let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as? [String: Any] {
                    guard let rest = json["rest"] as? [[String: Any]] else {return}
                    for num in rest {
//                        let latNumber = String(describing: num["latitude"]!)
//                        let lonNumber = String(describing: num["longitude"]!)
//                        let titleName = String(describing: num["name"]!)
//                        guard let lat = Double(latNumber) else {return}
//                        guard let lon = Double(lonNumber) else {return}
                    }
//                    print("\(json)")
                }
            }
            catch{
                print(error)
            }
        })
        task.resume()

    }
}

extension MapViewController: GMSMapViewDelegate {
    
    func mapView(_ mapView: GMSMapView, didTapInfoWindowOf marker: GMSMarker) {
        let coord = CLLocationCoordinate2DMake(mapLat, mapLng)
        let panoView = GMSPanoramaView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height))
        panoView.moveNearCoordinate(coord)
        view.addSubview(panoView)
        // GMSPanoramaViewを継承したクラスを作成して、戻るボタンを作成する必要がある？？？
    }
    
    func mapView(_ mapView: GMSMapView, didLongPressInfoWindowOf marker: GMSMarker) {
        let myWebView = WKWebView()
        myWebView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        view.addSubview(myWebView)
        guard let url = URL(string: urlString) else {
            return
        }
        myWebView.load(URLRequest(url: url))
    }
}
