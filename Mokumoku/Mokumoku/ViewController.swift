//
//  ViewController.swift
//  Mokumoku
//
//  Created by 野崎勇樹 on 2017/10/21.
//  Copyright © 2017年 野崎勇樹. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIViewControllerTransitioningDelegate {

    
    @IBAction func buttonDidTouch(_ sender: Any) {
        // 新しい View Controller をモーダル表示する
        let controller: UINavigationController! = self.storyboard?.instantiateViewController(withIdentifier: "NavigationController") as? UINavigationController
        controller.modalPresentationStyle = .custom
        controller.transitioningDelegate = self
        self.present(controller, animated: true, completion: {
        })
    }
    //    var myButton : UIButton!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Buttonを作る.
//        myButton = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
//        myButton.layer.position = self.view.center
//        myButton.layer.masksToBounds = true
//        myButton.layer.cornerRadius = 20.0
//        myButton.backgroundColor = UIColor.orange
//        myButton.setTitle("Present!", for: UIControlState.normal)
//        myButton.addTarget(self, action: #selector(onMyButtonClick(_:)), for: .touchUpInside)
//        // viewにButtonを追加.
//        self.view.addSubview(myButton)
//        self.present(self, animated: true, completion: nil)
//    }
    
    /*
     ボタンがタップされた時に呼び出されるメソッド.
     */
//    @objc func onMyButtonClick(_ sender : UIButton){
//
//        // コンテンツのViewControllerを生成.
//        let myContentViewController = UIViewController()
//
//        // コンテンツViewControllerのサイズを指定.
//        myContentViewController.preferredContentSize = CGSize(width: 200, height: 200)
//
//        // コンテンツViewControllerの背景を青色に設定.
//        myContentViewController.view.backgroundColor = UIColor.blue
//
//        //
//        myContentViewController.modalPresentationStyle = .popover
//
//        //
//        myContentViewController.popoverPresentationController?.permittedArrowDirections = .any
//        // PopverControllerを生成してコンテンツViewControllerをセット.
//        myContentViewController.popoverPresentationController?.sourceView = view
//        myContentViewController.popoverPresentationController?.sourceRect = sender.frame
//
//        myContentViewController.present(self, animated: true, completion: nil)
//    }

    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return CustomPresentationController(presentedViewController: presented, presenting: presented)
    }
}

