//
//  TenExample.swift
//  Mokumoku
//
//  Created by 野崎勇樹 on 2017/11/30.
//  Copyright © 2017年 野崎勇樹. All rights reserved.
//

import Foundation
import UIKit

class TenExample: UIViewController {
    
    let buttonX = TenExampleButton()
    var safeAreaInsets: UIEdgeInsets?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .green

        buttonX.backgroundColor = .gray
        buttonX.isUserInteractionEnabled = true
        buttonX.setTitle("ボタン", for: .normal)
        view.addSubview(buttonX)
//        didPasteViews(contentFrame: contentFrame, safreAreaInsets: safeAreaInsets)

    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        if #available(iOS 11, *) {
            safeAreaInsets = self.view.safeAreaInsets
        } else {
            safeAreaInsets = .zero
        }
        
        guard let safeAreaInsets = safeAreaInsets else { return }

        buttonX.frame = CGRect(x: view.frame.origin.x + safeAreaInsets.left,
                               y: view.frame.origin.y + safeAreaInsets.top + 15,
                               width: view.frame.width - safeAreaInsets.left - safeAreaInsets.right,
                               height: view.frame.height - safeAreaInsets.top - safeAreaInsets.bottom)

//        if #available(iOS 11, *) {
//            safeAreaInsets = self.view.safeAreaInsets
//        } else {
//            safeAreaInsets = .zero
//        }
//        guard let safeAreaInsets = safeAreaInsets else { return }
//
//        didChangeScreen(safeAreaInsets: safeAreaInsets)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
//    func didChangeScreen(safeAreaInsets: UIEdgeInsets) {
//        let deviceOrientation: UIDeviceOrientation!  = UIDevice.current.orientation
//
//        if UIDeviceOrientationIsLandscape(deviceOrientation) {
//            if #available(iOS 11, *){
//                safeAreaInsets = self.view.safeAreaInsets
//            } else {
//                safeAreaInsets = .zero
//            }
//            buttonX.frame = CGRect(x: view.frame.origin.x, y: view.frame.origin.y, width: view.frame.width + safeAreaInsets.left + safeAreaInsets.right, height: view.frame.height + safeAreaInsets.top + safeAreaInsets.bottom)
//        }
//    }
//    func didPasteViews(contentFrame:CGRect, safeAreaInsets: UIEdgeInsets) {
//        if #available(iOS 11, *) {
//            safeAreaInsets = self.view.safeAreaInsets
//        } else {
//            safeAreaInsets = .zero
//        }
//        buttonX.frame = CGRect(x: self.view.center.x - buttonX.position.x - safeAreaInsets.top, y: self.view.center.y - buttonX.position.y - safeAreaInsets.top, width: buttonX.frame.width, height: buttonX.frame.height)
//        buttonX.backgroundColor = .red
//    }
}
