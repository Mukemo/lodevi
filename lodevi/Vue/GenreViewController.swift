//
//  GenreViewController.swift
//  lodevi
//
//  Created by apple on 09/03/19.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit

class GenreViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    var dataService = DataService.instance
    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Genres"
        let collectionFlowLayout = UICollectionViewFlowLayout()
        collectionFlowLayout.estimatedItemSize = CGSize(width: (collectionView.bounds.width / 2), height: 55)
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataService.categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GenreCollectionViewCell", for: indexPath) as! GenreCollectionViewCell
        cell.layer.cornerRadius = 30
        cell.clipsToBounds = true
        cell.configureCell(category: dataService.categories[indexPath.row])
        return cell
    }
    
    override func size(forChildContentContainer container: UIContentContainer, withParentContainerSize parentSize: CGSize) -> CGSize {
        //let padding:CGFloat = 50
        //let collectionViewSize = collectionView.bounds.width - padding
        return CGSize(width: UIScreen.main.bounds.width / 2, height: 55)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top:20, left: 20, bottom: 20, right: 20)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "MusicListViewController") as? MusicListViewController
        vc?.category = dataService.categories[indexPath.row]
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}
extension GenreViewController:DataServiceDelegate{
    func musicByCategoryLoaded() {}
    func artistLoaded() {}
    func categoryLoaded() {
        OperationQueue.main.addOperation {
            self.collectionView.reloadData()
        }
    }
    func collectionLoaded() {}
    func audioLoaded() {}
    func videoLoaded() {}
    
    
}
