//
//  ViewController.swift
//  lodevi
//
//  Created by apple on 03/10/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit


class MainViewController: UIViewController{

    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    
    var frame = CGRect(x: 0, y: 0, width: 0, height: 0)
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 18/255, green: 8/255, blue: 16/255, alpha: 0.9)
        
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        
    }

    
    // MARK - 2 * Down here we are going to override the method of the scrollViewDelegate as a protocol
   /*func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        var pageNumber = scrollView.contentOffset.x / scrollView.frame.size.width
        pageController.currentPage = Int(pageNumber)
        
        
    }*/
    
    
    
    
//    @objc func didTapOpenButton(sender: UIBarButtonItem){
////        if self.revealViewController() != nil {
////            Home.target = self.revealViewController()
////            Home.action = "revealToggle:"
////            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
////        }
//    }
//    
//    @objc func openSearch(sender: UIBarButtonItem){
//         print("you have licked on search button")
//    }
}

