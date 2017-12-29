//
//  ViewController.swift
//  BuletoothSample
//
//  Created by 野崎勇樹 on 2017/12/25.
//  Copyright © 2017年 野崎勇樹. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var bule: Buletooth = Buletooth()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bule.centralManager.scanForPeripherals(withServices: nil, options: nil)
    }
}
