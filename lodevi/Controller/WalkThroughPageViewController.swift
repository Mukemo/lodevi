//
//  WalkThroughPageViewController.swift
//  lodevi
//
//  Created by apple on 17/02/19.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit

class WalkThroughPageViewController: UIPageViewController, UIPageViewControllerDataSource{
    // MARK:1 pproperties
    var pageHeadings = ["Things gonna be better","Believe in you", "Go hard and indeed"]
    var pageImages = ["onboard1","onboard2","onboard3"]
    var pageSuheadings = ["Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.","Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."]
    var currentIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        if let startingViewController = contentViewController(at: 0){
            setViewControllers([startingViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    
    //MARK: ViewpageCOntroller function oveeride implementation
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! WalktrhoughViewController).index
        index -= 1
        return contentViewController(at: index)
        
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! WalktrhoughViewController).index
        index += 1
        return contentViewController(at: index)
    }
    
    func contentViewController(at index: Int) -> WalktrhoughViewController? {
        if index < 0 || index >= pageHeadings.count {
            return nil
        }
        
        //let us create a compatible contentview
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        if let pageViewController = storyBoard.instantiateViewController(withIdentifier: "WalktrhoughContentViewController") as? WalktrhoughViewController {
            pageViewController.imageFile = pageImages[index]
            pageViewController.heading = pageHeadings[index]
            pageViewController.subheading = pageSuheadings[index]
            pageViewController.index = index
            return pageViewController
        }
        return nil
    }
    
    func forwardPage(){
      currentIndex += 1
        if let nextViewController = contentViewController(at: currentIndex){
            setViewControllers([nextViewController], direction: .forward, animated: true, completion: nil)
        }
    }
}
