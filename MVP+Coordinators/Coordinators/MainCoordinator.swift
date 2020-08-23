//
//  MainCoordinator.swift
//  MVP+Coordinators
//
//  Created by Андрей Шевчук on 12.08.2020.
//  Copyright © 2020 Андрей Шевчук. All rights reserved.
//

import UIKit

class MainCoordinator: Coordinator {
    
    private let window: UIWindow
    private let navigationController: UINavigationController
    private let builder: ModuleBuilder = ModuleBuilder()
    var startCoordinator: Coordinator?
    
    init(window: UIWindow, navigationController: UINavigationController) {
        self.window = window
        self.navigationController = navigationController
    }
    func start() {
        setupWindow()
    }
    func setupWindow(){
        setupStarterCoordinatot()
        self.window.rootViewController = navigationController
        self.window.makeKeyAndVisible()
    }
    func setupStarterCoordinatot(){
        let controller = builder.createMainModule()
        navigationController.pushViewController(controller, animated: true)
    }
}
