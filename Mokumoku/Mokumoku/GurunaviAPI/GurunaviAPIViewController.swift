//
//  GurunaviAPIViewController.swift
//  Mokumoku
//
//  Created by 野崎勇樹 on 2017/11/06.
//  Copyright © 2017年 野崎勇樹. All rights reserved.
//

import UIKit

class GurunaviAPIViewController: UIViewController, URLSessionDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func getData() {
        let url = URL(string: "https://api.gnavi.co.jp/RestSearchAPI/20150630/?keyid=[d27e539fbe13dd562fc22dfcf5b04acc]&format=json")
        guard let urlS = url else {return}
        let request = URLRequest(url: urlS)
        // iOS8までの書き方
//        let connection = NSURLConnection(request: request, delegate: self, startImmediately: false)
        let urlSession = URLSession(configuration: .default, delegate: self, delegateQueue: .main)
        let task = urlSession.dataTask(with: request)
        task.resume()
        
    }
    
    func response(res: URLResponse, data: Data, error: Error) {
        print(data)
    }
    
    @IBAction func tapButton(_ sender: Any) {
        getData()
    }
}
