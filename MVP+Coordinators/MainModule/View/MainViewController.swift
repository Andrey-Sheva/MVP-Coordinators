//
//  MainViewController.swift
//  MVP+Coordinators
//
//  Created by Андрей Шевчук on 14.08.2020.
//  Copyright © 2020 Андрей Шевчук. All rights reserved.
//

import UIKit

class MainViewController: UIViewController{
    var presenter: MainPresenter!
    let tableView = UITableView()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
}


extension MainViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.users?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MainViewControllerCell
        let user = presenter.users?[indexPath.row]
        cell.name.text = user?.name
        cell.userName.text = user?.username
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func setupTableView(){
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(MainViewControllerCell.self, forCellReuseIdentifier: "cell")
        
        self.view.addSubview(tableView)

        navigationItem.title = "Accounts"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

extension MainViewController: MainViewProtocol{
    func succes() {
        tableView.reloadData()
    }
    
    func failure(error: Error) {
        let alert = UIAlertController(title: "Error", message: "Check your internet connection!!!", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))

        self.present(alert, animated: true)
        print("error \(error.localizedDescription)")
    }

}
    

