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
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 18/255, green: 8/255, blue: 16/255, alpha: 0.9)
        
        if let username = defaults.string(forKey: DEFAULTS_NAME){
            usernameLabel.text = username
        }else{
            self.dismiss(animated: true, completion: nil)
        }
    }
}

