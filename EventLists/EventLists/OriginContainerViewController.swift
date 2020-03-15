//
//  OriginContainerViewController.swift
//  EventLists
//
//  Created by 野崎勇樹 on 2019/05/10.
//  Copyright © 2019 野崎勇樹. All rights reserved.
//

import UIKit

@objcMembers
final class OriginContainerViewController: UIViewController {

    var firstButton: UIButton!
    var secondButton: UIButton!
    
    @IBOutlet weak var textFiled: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        firstButton = UIButton(frame: CGRect(x: self.view.frame.width / 10, y: self.view.frame.height / 3, width: self.view.frame.width / 3, height: self.view.frame.height / 5))
        firstButton.setTitle("１番目", for: .normal)
        firstButton.addTarget(self, action: #selector(didTapFirstButton(_:)), for: .touchUpInside)
        firstButton.setTitleColor(.white, for: .normal)
        firstButton.backgroundColor = .black
        view.addSubview(firstButton)
        
        secondButton = UIButton(frame: CGRect(x: self.view.frame.width / 2, y: self.view.frame.height / 3, width: self.view.frame.width / 3, height: self.view.frame.height / 5))
        secondButton.setTitle("２番目", for: .normal)
        secondButton.addTarget(self, action: #selector(didTapSecondButton(_:)), for: .touchUpInside)
        secondButton.setTitleColor(.white, for: .normal)
        secondButton.backgroundColor = .black
        view.addSubview(secondButton)
        
        let firstVC = FirstContainerViewController()
        addChild(firstVC)
    }
    
    func didTapFirstButton(_ sender: Any) {
        if children.isEmpty {
            print("VCはありません・・・・")
        }
        children.forEach { vc in
            print(vc)
            if let firstVC = vc as? FirstContainerViewController {
                firstVC.showMessage(message: "神様ですよ")
            }
        }
    }
    
    func didTapSecondButton(_ sender: Any) {
    }
}
