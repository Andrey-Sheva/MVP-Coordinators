//
//  ModuleBuilder.swift
//  MVP+Coordinators
//
//  Created by Андрей Шевчук on 16.08.2020.
//  Copyright © 2020 Андрей Шевчук. All rights reserved.
//

import UIKit

protocol Builder {
    func createMainModule() -> UIViewController
}

class ModuleBuilder: Builder{
    func createMainModule() -> UIViewController {
        let view = MainViewController()
        let sessionClient = SessionHTTPClient()
        let presenter = MainPresenter(view: view, sessionClient: sessionClient)
        view.presenter = presenter
        return view
    }
}
