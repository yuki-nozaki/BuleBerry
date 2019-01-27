//
//  GIFViewController.swift
//  EventLists
//
//  Created by 野崎勇樹 on 2019/01/27.
//  Copyright © 2019年 野崎勇樹. All rights reserved.
//

import UIKit
import WebKit
import SwiftyGif

final class GIFViewController: UIViewController {
    
    private var webView: WKWebView!
    private var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        createGifImage()
    }
}

extension GIFViewController {
    
    // WKWebViewでGIFを再生する場合
    fileprivate func createGifImage() {
        
        let webViewFrame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        webView = WKWebView(frame: webViewFrame)
        guard let gifFilePath = Bundle.main.path(forResource: "Rotating_earth", ofType: "gif") else { return }
        do {
            let gifData = try Data(contentsOf: URL(fileURLWithPath: gifFilePath))
            webView.load(gifData, mimeType: "image/gif", characterEncodingName: "utf-8", baseURL: URL(fileURLWithPath: ""))
        }
        catch let error {
            print(error)
        }
        self.view.addSubview(webView)
    }
    
    // UIImageViewで、GIFを再生する場合
    // リモートから取得したUIImageを、ローカルで再生できるようにする
    fileprivate func createGIFIamgeView() {
        let imageViewFrame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        imageView = UIImageView(frame: imageViewFrame)
        
        
        let image = UIImage(gifName: "Rotating_earth")
        imageView.image = image
        self.view.addSubview(imageView)
//        let gifImageUrlString = "https://ja.wikipedia.org/wiki/%E3%83%95%E3%82%A1%E3%82%A4%E3%83%AB:Rotating_earth_(large).gif"
//        guard let url = URL(string: gifImageUrlString) else { return }
    }
}
