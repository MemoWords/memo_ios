//
//  SceneDelegate.swift
//  memo
//
//  Created by Elias Ferreira on 14/08/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    let repository = CardRepository()
    let settings = Settings.shared

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let tabBarController = TabBar()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = tabBarController
        window?.overrideUserInterfaceStyle = settings.theme
        window?.makeKeyAndVisible()
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        repository.updateCardsToStudy()
    }

}
