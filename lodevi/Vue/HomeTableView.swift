//
//  HomeTableView.swift
//  lodevi
//
//  Created by apple on 26/10/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

class HomeTableView: UITableView,UITableViewDelegate, UITableViewDataSource{

    override func awakeFromNib() {
        self.dataSource = self
        self.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        
        if row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ScrollViewCell") as! ScrollViewCell
            tableView.frame.size = tableView.contentSize
            return cell
        }else if row == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "GenreViewCell") as! GenreViewCell
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "NewReleaseViewCell") as! NewReleaseViewCell
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 1 {
            return UITableViewAutomaticDimension
        }
        return UITableViewAutomaticDimension
    }
}
