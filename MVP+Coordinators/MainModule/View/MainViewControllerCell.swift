//
//  MainViewControllerCell.swift
//  MVP+Coordinators
//
//  Created by Андрей Шевчук on 16.08.2020.
//  Copyright © 2020 Андрей Шевчук. All rights reserved.
//

import UIKit

class MainViewControllerCell: UITableViewCell{
    
    lazy var name: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var userName: UILabel = {
       let label = UILabel()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var userImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "image")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(name)
        addSubview(userName)
        addSubview(userImage)
        setupImageConstraints()
        setupNameConstraints()
        setupSecondNameConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupImageConstraints(){
        userImage.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        userImage.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        userImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        userImage.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }
    func setupNameConstraints(){
        name.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        name.leftAnchor.constraint(equalTo: userImage.rightAnchor).isActive = true
        name.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        name.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -contentView.bounds.height / 0.8).isActive = true
    }
    func setupSecondNameConstraints(){
        userName.topAnchor.constraint(equalTo: name.bottomAnchor).isActive = true
        userName.leftAnchor.constraint(equalTo: userImage.rightAnchor).isActive = true
        userName.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        userName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
}
