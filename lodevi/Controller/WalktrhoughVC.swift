//
//  WalktrhoughVC.swift
//  lodevi
//
//  Created by apple on 17/02/19.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit

class WalktrhoughVC: UIViewController {
    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet var nextButton: UIButton!{
        didSet{
            nextButton.layer.cornerRadius = 25.0
            nextButton.layer.masksToBounds = true
            
        }
    }
    @IBOutlet var skipButton: UIButton!
    var walktrhoughPageViewController:WalkThroughPageViewController?
    let defaults = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func nextButtonClicked(sender: UIButton){
        print("me")
        if let index = walktrhoughPageViewController?.currentIndex {
            print(index)
            switch index{
            case 0...1:
                walktrhoughPageViewController?.forwardPage()
            case 2:
                if let newViewcontroller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController {
                    present(newViewcontroller, animated: true, completion: nil)
                }
            default: break
            }
        }
        updateUI()
    }
    func updateUI(){
        if let index = walktrhoughPageViewController?.currentIndex{
            switch index{
            case 0...1:
                nextButton.setTitle("SUIVANT", for: .normal)
                skipButton.isHidden = false
            case 2:
                nextButton.setTitle("Commencez", for: .normal)
                skipButton.isHidden = true
            default: break
            }
            pageControl.currentPage = index
        }
    }
    override func viewDidAppear(_ animated: Bool) {
            if  (defaults.string(forKey: DEFAULTS_AUTHENTICATED) != nil) || (defaults.string(forKey: DEFAULTS_NAME) != nil) || (defaults.string(forKey: DEFAULTS_PHONE) != nil) {
                performSegue(withIdentifier: "AlreadyLoggedIn", sender: self)
            }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination
        if let pageViewController = destination as? WalkThroughPageViewController {
            walktrhoughPageViewController = pageViewController
        }
    }
}
