//
//  AppDelegate.swift
//  Alinea
//
//  Created by Manish Agrawal on 23/11/20.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let tabbar = AITabbarRouter.createModule()
        self.window?.rootViewController = tabbar
        self.window?.makeKeyAndVisible()
        return true
    }
}

