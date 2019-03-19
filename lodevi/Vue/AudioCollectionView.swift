//
//  AudioCollectionView.swift
//  lodevi
//
//  Created by apple on 03/03/19.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit

class AudioCollectionView: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegate{
    var dataService = DataService.instance
    override func awakeFromNib() {
        self.dataSource = self
        self.delegate = self
//        activitiIndicator.center = self.center
//        activitiIndicator.hidesWhenStopped = true
//        activitiIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.white
//        self.addSubview(activitiIndicator)
        self.dataService.delegate = self
        self.dataService.getAllVideos(completion: { Success in
            if Success{
                print("it ok")
            }
        })
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //return DataService.instance.audios.count
        return dataService.videos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AudioCollectionViewCell", for: indexPath) as! AudioCollectionViewCell
        return cell
    }
}

extension AudioCollectionView: DataServiceDelegate{
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
            print("Data in Audio Collection \(self.dataService.collections)")
            self.reloadData()
        }
    }


}
