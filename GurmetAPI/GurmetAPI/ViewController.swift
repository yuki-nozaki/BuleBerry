//
//  ViewController.swift
//  GurmetAPI
//
//  Created by 野崎勇樹 on 2017/12/07.
//  Copyright © 2017年 野崎勇樹. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var selectedRow: Int?
    
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.label.text = WeatherMaster.sharedInstance.getArray()[self.selectedRow!] as? String
    }
}

