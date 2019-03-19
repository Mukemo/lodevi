//
//  HomeTableView.swift
//  lodevi
//
//  Created by apple on 26/10/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

class HomeTableView: UITableView,UITableViewDelegate, UITableViewDataSource{
    var dataService = DataService.instance
    override func awakeFromNib() {
        super.awakeFromNib()
        self.dataSource = self
        self.delegate = self
        self.dataService.delegate = self
        dataService.getAllCollections { Success in
            if Success {
                print("Categories Loaded")
            }
        }
        dataService.getAllAudios(completion: { Success in
            if Success {
                print("Audios Loaded")
            }
        })
        dataService.getAllArtists(completion: { Success in
           if Success {
            print("Artists Loaded")
           }
        })
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        if row == 0 {
         let cell = tableView.dequeueReusableCell(withIdentifier: "ScrollViewCell") as! ScrollViewCell
        return cell
        }else if row == 1{
         let cell = tableView.dequeueReusableCell(withIdentifier: "NewSongTbViewCell") as! NewSongTbViewCell
            //cell.isHidden = true
            return cell
        }else if row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PopularSongTbViewCell") as! PopularSongTbViewCell
            //cell.isHidden = true
            return cell
        }else if row == 3{
            let cell = tableView.dequeueReusableCell(withIdentifier: "SuggestionTbViewCell") as! SuggestionTbViewCell
            return cell
        }else if row == 4 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "AudioTbViewCell") as! AudioTbViewCell
            return cell
        }else if row == 5 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "VideoTbViewCell") as! VideoTbViewCell
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "AlbumsTbViewCell") as! AlbumsTbViewCell
            return cell
        }
    }
}
extension HomeTableView:DataServiceDelegate{
    func artistLoaded() {
        OperationQueue.main.addOperation {
            print(self.dataService.artists)
        }
    }
    
    func categoryLoaded() {
        OperationQueue.main.addOperation {
            print(self.dataService.categories)
        }
    }
    
    func collectionLoaded() {
        OperationQueue.main.addOperation {
            print(self.dataService.collections)
        }
    }
    
    func audioLoaded() {
        OperationQueue.main.addOperation {
            print(self.dataService.audios)
        }
    }
    
    func videoLoaded() {
        OperationQueue.main.addOperation {
            print(self.dataService.videos)
        }
    }
    
    func musicByCategoryLoaded() {
        OperationQueue.main.addOperation {
            print(self.dataService.audios)
        }
    }
    
    
}
