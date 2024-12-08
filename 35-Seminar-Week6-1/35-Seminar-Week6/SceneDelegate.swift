//
//  SceneDelegate.swift
//  35-Seminar-Week6
//
//  Created by 최안용 on 11/27/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        self.window = UIWindow(windowScene: windowScene)
        let navigationController = UINavigationController(rootViewController: TimeViewController())
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
    }
}

