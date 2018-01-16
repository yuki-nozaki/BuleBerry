//
//  ExWhetherViewController.swift
//  Mokumoku
//
//  Created by 野崎勇樹 on 2017/11/08.
//  Copyright © 2017年 野崎勇樹. All rights reserved.
//

import UIKit

class ExWhetherViewController: UIViewController {

    var info: String?
    @IBOutlet weak var infoLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        infoLabel.text = info
    }
}
