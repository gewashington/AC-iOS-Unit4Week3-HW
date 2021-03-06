//
//  FavoritesViewController.swift
//  Unit4Week3Homework-StudentVersion
//
//  Created by C4Q on 1/6/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController {

    var favoritesView = FavoritesView()
    var favePictures = [Pixabay]() {
        didSet {
            favoritesView.favoritesTableView.reloadData()
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.gray
        view.addSubview(favoritesView)
        navigationItem.title =  "Favorties"
        favoritesView.favoritesTableView.dataSource = self
        favoritesView.favoritesTableView.delegate = self
        self.favePictures = FileManagerHelper.manager.getAllPixabayImages()

        
    }

}

extension FavoritesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return favePictures.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = favoritesView.favoritesTableView.dequeueReusableCell(withIdentifier: "FavoritesTableViewCell", for: indexPath) as! FavoritesTableViewCell
       let picture = favePictures[indexPath.row]
        cell.favoritesImageView.image = FileManagerHelper.manager.getImage(with: picture.webformatURL)
       

        return cell
    }
    
    
}
