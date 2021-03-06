//
//  FavoritesView.swift
//  Unit4Week3Homework-StudentVersion
//
//  Created by C4Q on 1/6/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class FavoritesView: UIView {
    
    lazy var favoritesTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(FavoritesTableViewCell.self, forCellReuseIdentifier: "FavoritesTableViewCell")
        tableView.backgroundColor = UIColor.gray
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = .green
        setupFavoritesTableView()
    }
    
    private func setupFavoritesTableView() {
        addSubview(favoritesTableView)
        favoritesTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            favoritesTableView.topAnchor.constraint(equalTo:   safeAreaLayoutGuide.topAnchor),
            favoritesTableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            favoritesTableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            favoritesTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
            
            ])
    }
    
    
    
}
