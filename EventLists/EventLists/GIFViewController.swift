//
//  GIFViewController.swift
//  EventLists
//
//  Created by 野崎勇樹 on 2019/01/27.
//  Copyright © 2019年 野崎勇樹. All rights reserved.
//

import UIKit
import WebKit

final class GIFViewController: UIViewController {
    
    private var webView: WKWebView!

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
    fileprivate func createGIFIamgeView() {
        
    }
}
