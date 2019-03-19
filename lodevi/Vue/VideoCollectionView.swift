//
//  VideoCollectionView.swift
//  lodevi
//
//  Created by apple on 03/03/19.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit

class VideoCollectionView: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegate{
    var dataService = DataService.instance
    
    override func awakeFromNib() {
        self.dataSource = self
        self.delegate = self
        dataService.delegate = self
        dataService.getAllVideos { Success in
            if Success{
                print("It's working")
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataService.videos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VideoCollectionViewCell", for: indexPath) as! VideoCollectionViewCell
        cell.configureUI(video: dataService.videos[indexPath.row])
        return cell
    }

}

extension VideoCollectionView: DataServiceDelegate{
    func musicByCategoryLoaded() {
        
    }
    
    func artistLoaded() {

    }

    func categoryLoaded() {

    }

    func collectionLoaded() {

    }

    func audioLoaded() {

    }

    func videoLoaded() {
        OperationQueue.main.addOperation {
            self.reloadData()
        }
    }


}
