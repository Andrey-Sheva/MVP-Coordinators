//
//  MainPresenter.swift
//  MVP+Coordinators
//
//  Created by Андрей Шевчук on 12.08.2020.
//  Copyright © 2020 Андрей Шевчук. All rights reserved.
//

import Foundation

protocol MainViewProtocol: class{
    func succes()
    func failure(error: Error)
}
protocol MainViewPresenterProtocol{
    init(view: MainViewProtocol, sessionClient: HTTPClient)
    func getUsers()
    var users: [Person]? {get set}
}



class MainPresenter: MainViewPresenterProtocol{
    var users: [Person]?
    let urlString = "https://jsonplaceholder.typicode.com/users"
    weak var view: MainViewProtocol?
    let sessionClient: HTTPClient!
    
    required init(view: MainViewProtocol, sessionClient: HTTPClient){
        self.view = view
        self.sessionClient = sessionClient
        getUsers()
    }
    func getUsers() {
        guard let url = URL(string: urlString) else {return}
        sessionClient.get(from: url) { [weak self] (result) in
            guard self != nil else { return }
            DispatchQueue.main.async {
                switch result {
                    case .success(let users):
                        self?.users = users
                        self?.view?.succes()
                    case .failure(let error):
                        self?.view?.failure(error: error)
                }
            }
        }
    }
}
