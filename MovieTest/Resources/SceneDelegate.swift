//
//  SceneDelegate.swift
//  MovieTest
//
//  Created by Denny Arfansyah on 24/06/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: scene)
        let genreController = GenreController()
        window?.rootViewController = UINavigationController(rootViewController: genreController)
        window?.makeKeyAndVisible()
        
    }

}
