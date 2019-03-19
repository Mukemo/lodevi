//
//  MusicListViewController.swift
//  lodevi
//
//  Created by apple on 14/03/19.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit

class MusicListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var activitiIndicator = UIActivityIndicatorView()
    var category:Category?
    var dataService = DataService.instance
    override func viewDidLoad() {
        super.viewDidLoad()
        activitiIndicator.center = self.view.center
        activitiIndicator.hidesWhenStopped = true
        activitiIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.white
        self.view.addSubview(activitiIndicator)
        dataService.delegate = self
        print(category!.name)
        print(category!.id)
        activitiIndicator.startAnimating()
        dataService.getAllMusicByGenderId(categoryId: category!.id) { (Success) in
            if Success{
                OperationQueue.main.addOperation {
                  //self.activitiIndicator.stopAnimating()
                }
            }
        }
        let backButton = UIBarButtonItem()
        backButton.title = ""
        navigationItem.backBarButtonItem = backButton
    }
}
extension MusicListViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataService.audios.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListMusicTableViewCell", for: indexPath) as? ListMusicTableViewCell
        cell?.configure(audio: dataService.audios[indexPath.row])
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       let storyBoard = UIStoryboard(name: "Main", bundle: nil)
       let vc = storyBoard.instantiateViewController(withIdentifier: "NowPlayingViewController") as? NowPlayingViewController
        vc?.audioMusic = dataService.audios[indexPath.row]
        print(indexPath.row)
       self.navigationController?.pushViewController(vc!, animated: true)
    }
    
}
extension MusicListViewController:DataServiceDelegate{
    func artistLoaded() {}
    
    func categoryLoaded() {}
    
    func collectionLoaded() {}
    
    func audioLoaded() {
    }
    
    func videoLoaded() {}
    
    func musicByCategoryLoaded() {
        OperationQueue.main.addOperation {
            self.activitiIndicator.startAnimating()
            self.tableView.reloadData()
        }
    }

}
