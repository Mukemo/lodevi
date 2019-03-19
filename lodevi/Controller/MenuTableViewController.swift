//
//  MenuTableViewController.swift
//  lodevi
//
//  Created by apple on 23/10/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController {
    @IBOutlet weak var usernameLabel: UILabel!
    let defaults = UserDefaults.standard
    @IBOutlet weak var deconnexionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 18/255, green: 8/255, blue: 16/255, alpha: 0.9)
        
        if let username = defaults.string(forKey: DEFAULTS_NAME){
            usernameLabel.text = username
        }else{
            usernameLabel.text = "Unknown"
        }
        deconnexionLabel.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(clickable))
        tapGesture.numberOfTapsRequired = 1
        deconnexionLabel.addGestureRecognizer(tapGesture)
    }
    @objc func clickable(){
       defaults.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
        defaults.synchronize()
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        if let walktrhoughVC = storyBoard.instantiateViewController(withIdentifier: "WalktrhoughVC") as? WalktrhoughVC{
        self.present(walktrhoughVC, animated: true, completion: nil)
        }
    }
}

