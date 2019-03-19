//
//  HomeViewController.swift
//  lodevi
//
//  Created by apple on 26/10/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit
import Toast_Swift

class HomeViewController: UIViewController{
    var dataService = DataService.instance
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var menuButton: UIBarButtonItem!
    let defaults = UserDefaults.standard
    var once:Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()
       DataService.instance.delegate = self
       dataService.getAllArtists(completion: { Success in if Success { print("wow")} })
       dataService.getAllCategories(completion: { Success in if Success { print("wow")} })
       dataService.getAllCollections(completion: { Success in if Success { print("wow")} })
       dataService.getAllAudios(completion: { Success in if Success { print("wow")} })
       dataService.getAllVideos(completion: { Success in if Success { print("wow")} })
        self.view.backgroundColor = UIColor(red: 18/255, green: 8/255, blue: 16/255, alpha: 1)
        self.title = "Accueil"
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
//        var style = ToastStyle()
//
//        // this is just one of many style options
//        style.messageColor = .white
//        style.backgroundColor = UIColor(red: 255/255, green: 65/255, blue: 133/255, alpha: 1)
//        // present the toast with the new style
//        self.view.makeToast("   Bienvenu \(defaults.string(forKey: DEFAULTS_NAME)!)  ", duration: 3.0, position: .center, style: style)

    }
}
extension HomeViewController: DataServiceDelegate{
    func musicByCategoryLoaded() {}
    func audioLoaded() {}
    func videoLoaded() {}
    func artistLoaded() {}
    func categoryLoaded() {}
    func collectionLoaded() {}
        
}

//extension HomeViewController{
//    func showToast(message: String){
//        //getting the screen window
//        guard let window = UIApplication.shared.keyWindow else {
//            return
//        }
//        let toastLabel = UILabel()
//        toastLabel.text = message
//        toastLabel.textAlignment = NSTextAlignment.center
//        toastLabel.font = UIFont(name: "Heebo", size: 14)
//        toastLabel.textColor = UIColor.white
//        toastLabel.backgroundColor = UIColor(red: 220/255, green: 18/255, blue: 127/255, alpha: 1)
//        toastLabel.numberOfLines = 0
//        let textSize = toastLabel.intrinsicContentSize
//        let labelHeight = (textSize.width / window.frame.width) * 40
//        let labelWidh = min(textSize.width, window.frame.width - 40)
//        let lblHeight = min(labelHeight, textSize.height + 60)
//        toastLabel.frame = CGRect(x: 30, y: (window.frame.height - 90) - lblHeight, width:labelWidh + 40 , height: lblHeight)
//        toastLabel.center.x = window.center.x
//        toastLabel.layer.cornerRadius = 10
//        //toastLabel.layer.borderWidth = 100
//        //toastLabel.layer.borderColor = UIColor(red: 220/255, green: 18/255, blue: 127/255, alpha: 1).cgColor
//        toastLabel.layer.masksToBounds = true
//        window.addSubview(toastLabel)
//
//        //animating the toast label
//        UIView.animate(withDuration: 10.0, animations: {
//            toastLabel.alpha = 0
//        }) { (_) in
//            toastLabel.removeFromSuperview()
//        }
//    }
//}

