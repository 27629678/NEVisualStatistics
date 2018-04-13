//
//  AppDelegate.swift
//  demo
//
//  Created by hzyuxiaohua on 11/04/2018.
//  Copyright © 2018 hzyuxiaohua. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions
        launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool
    {
        let target = NEWindow(frame: UIScreen.main.bounds)
        target.rootViewController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()
        window = target
        
        return true
    }


}

