//
//  AppDelegate.swift
//  ChatApp
//
//  Created by Hilmihan Çalışan on 2.01.2023.
//

import UIKit
import FirebaseCore


@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow()
        window?.rootViewController = UINavigationController(rootViewController: LoginVC())
        window?.makeKeyAndVisible()
        FirebaseApp.configure()
        return true
    }

    

}


