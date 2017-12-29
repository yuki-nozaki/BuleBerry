//
//  AppDelegate.swift
//  Maps
//
//  Created by 野崎勇樹 on 2017/12/29.
//  Copyright © 2017年 野崎勇樹. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        GMSServices.provideAPIKey("AIzaSyBDfMNPnw942K0YLh81ukepG2e5Q4E0hWI")
        return true
    }

}

