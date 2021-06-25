//
//  AppDelegate.swift
//  MovieTest
//
//  Created by Denny Arfansyah on 24/06/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: GenreController())
        window?.makeKeyAndVisible()
        
        return true
    }

}
