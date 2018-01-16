//
//  ViewController.swift
//  FackNews
//
//  Created by 野崎勇樹 on 2018/01/15.
//  Copyright © 2018年 野崎勇樹. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var pageMenu: CAPSPageMenu?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "PAGE MENU"
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 30.0/255.0, green: 30.0/255.0, blue: 30.0/255.0, alpha: 1.0)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.barStyle = UIBarStyle.black
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.orange]

        var controllerArray : [UIViewController] = []
        
        var controller1 : UIViewController = UIViewController(nibName: "TableViewController", bundle: nil)
        controller1.title = "SAMPLE TITLE"
        controllerArray.append(controller1)
        
        var controller2 : UIViewController = UIViewController(nibName: "TableViewController", bundle: nil)
        controller2.title = "SAMPLE TITLE"
        controllerArray.append(controller2)
        
        var controller3 : UIViewController = UIViewController(nibName: "TableViewController", bundle: nil)
        controller3.title = "SAMPLE TITLE"
        controllerArray.append(controller3)
        
        var controller4 : UIViewController = UIViewController(nibName: "TableViewController", bundle: nil)
        controller4.title = "SAMPLE TITLE"
        controllerArray.append(controller4)

        var parameters: [CAPSPageMenuOption] = [
            .scrollMenuBackgroundColor(UIColor(red: 30.0/255.0, green: 30.0/255.0, blue: 30.0/255.0, alpha: 1.0)),
            .viewBackgroundColor(UIColor(red: 20.0/255.0, green: 20.0/255.0, blue: 20.0/255.0, alpha: 1.0)),
            .selectionIndicatorColor(UIColor.orange),
            .bottomMenuHairlineColor(UIColor(red: 70.0/255.0, green: 70.0/255.0, blue: 80.0/255.0, alpha: 1.0)),
            .menuItemFont(UIFont(name: "HelveticaNeue", size: 13.0)!),
            .menuHeight(80.0),
            .menuItemWidth(90.0),
            .centerMenuItems(true)
        ]

        let frame = CGRect(x: 0.0, y: 0.0, width: self.view.frame.width, height: self.view.frame.height)
        pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: frame, pageMenuOptions: parameters)

        self.addChildViewController(pageMenu!)
        self.view.addSubview(pageMenu!.view)
        
        pageMenu!.didMove(toParentViewController: self)

    }

}

