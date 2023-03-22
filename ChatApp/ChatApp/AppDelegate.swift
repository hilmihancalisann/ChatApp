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
        window?.rootViewController = configureNavigationController(rootViewController: HomeViewController())
        window?.makeKeyAndVisible()
        FirebaseApp.configure()
        return true
    }

    

    private func configureNavigationController(rootViewController: UIViewController)-> UINavigationController {
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.systemBlue.cgColor, UIColor.systemPink.cgColor]
        gradient.frame = .init(x: 0, y: 0, width: UIScreen.main.bounds.height * 2, height: 64)
        let conroller = UINavigationController(rootViewController: rootViewController)
        let appearence = UINavigationBarAppearance()
        appearence.configureWithDefaultBackground()
        appearence.backgroundImage = self.image(fromLayer: gradient)
        appearence.titleTextAttributes = [.foregroundColor: UIColor.white, .font:UIFont.preferredFont(forTextStyle: .title2)]
        conroller.navigationBar.standardAppearance = appearence
        conroller.navigationBar.compactAppearance = appearence
        conroller.navigationBar.scrollEdgeAppearance = appearence
        conroller.navigationBar.compactAppearance = appearence
    
        return conroller
    }
    
    func image(fromLayer layer: CALayer) -> UIImage {
        UIGraphicsBeginImageContext(layer.frame.size)
        layer.render(in: UIGraphicsGetCurrentContext()!)
        let outputImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return outputImage!
    }
}


