//
//  SceneDelegate.swift
//  MVP+Coordinators
//
//  Created by Андрей Шевчук on 12.08.2020.
//  Copyright © 2020 Андрей Шевчук. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var coordinator: MainCoordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        let navVC = UINavigationController()
        guard let window = window else {return}
        coordinator = MainCoordinator(window: window, navigationController: navVC)
        coordinator?.start()
    }
}

