//
//  ScrollViewCell.swift
//  lodevi
//
//  Created by apple on 26/10/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

class ScrollViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    var timer = Timer()
    let images = ["album","album","album","album","album","album","album","album","album","album","album"]
    var counter = 0
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView?.delegate = self
        collectionView?.dataSource = self
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewFlowLayout.estimatedItemSize = CGSize(width: (collectionView?.frame.width)!, height: 200)
        pageControl.numberOfPages = images.count
        pageControl.currentPage = 0
        self.collectionView.isPagingEnabled = true
        DispatchQueue.main.async {
            self.timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(self.imageChange), userInfo: nil, repeats: true)
        }
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.images.count
    }
    @objc func imageChange(){
        if counter < self.images.count {
            let index = IndexPath.init(item: counter, section: 0)
            self.collectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            self.collectionView.isPagingEnabled = true
            pageControl.currentPage = counter
            counter += 1
        }else{
            counter = 0
            let index = IndexPath.init(item: counter, section: 0)
            self.collectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            self.collectionView.isPagingEnabled = true
            pageControl.currentPage = counter
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "SlideShow", for: indexPath)
        cell.layer.cornerRadius = 15
        cell.layer.masksToBounds = true
        if let vc = cell.viewWithTag(101) as? UIImageView{
            vc.image = UIImage(named: self.images[indexPath.row])
        }else if let ab = cell.viewWithTag(102) as? UIPageControl{
            ab.currentPage = indexPath.row
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = self.collectionView.frame.size
        return CGSize(width: size.width, height: 200)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
}



