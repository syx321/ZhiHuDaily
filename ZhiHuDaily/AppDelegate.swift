//
//  AppDelegate.swift
//  ZhiHuDaily
//
//  Created by 苏易肖 on 2021/3/29.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        let navigationController = UINavigationController(rootViewController: MainPage())
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        
        return true
    }


}

