//
//  ArtistsViewController.swift
//  lodevi
//
//  Created by apple on 24/02/19.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit

class ArtistsViewController: UIViewController {

    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var collectionView: UICollectionView!
    var dataService = DataService.instance
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.navigationController?.navigationBar.titleTextAttributes =
//            [NSAttributedStringKey.foregroundColor: UIColor.white,
//             NSAttributedStringKey.font: UIFont(name: "Heebo", size: 14)!]
        self.title = "Artistes"

        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        //DataService.instance.delegate = self
        //dataService.getAllArtists(completion: { Success in if Success { print("wow")} })
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
}
extension ArtistsViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataService.artists.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ArtistViewCell", for: indexPath) as? ArtistViewCell
        cell?.updateUI(artist: dataService.artists[indexPath.row])
        return cell!
    }
}
extension ArtistsViewController:DataServiceDelegate{
    func musicByCategoryLoaded() {
        
    }
    
    func audioLoaded() {
    }
    
    func videoLoaded() {
        
    }
    
    func artistLoaded() {
        OperationQueue.main.addOperation {
            self.collectionView.reloadData()
        }
    }
    
    func categoryLoaded() {
        
    }
    
    func collectionLoaded() {
        
    }
    
    
}
