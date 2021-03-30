//
//  AppDelegate.swift
//  Movies-DB
//
//  Created by Abdelrahman Sobhy on 3/10/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window?.rootViewController = UINavigationController(rootViewController: MoviesRouterImpl.createModule())
        return true
    }
}

