//
//  NowPlayingViewController.swift
//  lodevi
//
//  Created by apple on 28/10/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

class NowPlayingViewController: UIViewController, UIScrollViewDelegate{

    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func setUpViews(){
        self.scrollView.delegate = self
        self.scrollView.isPagingEnabled = false
        self.scrollView.showsVerticalScrollIndicator = false
        self.scrollView.alwaysBounceVertical = true
        self.scrollView.alwaysBounceHorizontal = false
        self.scrollView.contentInset = UIEdgeInsetsMake(500, 0, 0, 0)
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        if velocity.y >= 0 {
            DispatchQueue.main.asyncAfter(deadline: .now(), execute: {
                UIView.animate(withDuration: 0.5, animations: {
                    self.scrollView.setContentOffset(CGPoint(x:0,y: -100), animated: false)
                })
            })
        }else if (velocity.y <= 0) {
            UIView.animate(withDuration: 0.5, animations: {
                self.scrollView.setContentOffset(CGPoint(x:0,y: -500), animated: false)
            })
        }
    }

}






























































