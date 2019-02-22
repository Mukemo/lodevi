//
//  HomeViewController.swift
//  lodevi
//
//  Created by apple on 26/10/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    var dataService = DataService.instance
    @IBOutlet weak var menuButton: UIBarButtonItem!
    let defaults = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
//        defaults.removeObject(forKey: DEFAULTS_AUTHENTICATED)
//        defaults.removeObject(forKey: DEFAULTS_NAME)
//        defaults.removeObject(forKey: DEFAULTS_PHONE)
       DataService.instance.delegate = self
       dataService.getAllArtists(completion: { Success in if Success { print("wow")} })
       dataService.getAllCategories(completion: { Success in if Success { print("wow")} })
       dataService.getAllCollections(completion: { Success in if Success { print("wow")} })
        self.view.backgroundColor = UIColor(red: 18/255, green: 8/255, blue: 16/255, alpha: 1)
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
    }
}
extension HomeViewController: DataServiceDelegate{
    func artistLoaded() {
        //print("Liste des artistes : \(DataService.instance.artists)")
    }
    func categoryLoaded(){
        //print("Liste des categories : \(DataService.instance.categories)")
    }
    func collectionLoaded() {
        //print("Liste des collections: \(DataService.instances.collections)")
    }
}
