//
//  AlertView.swift
//  lodevi
//
//  Created by apple on 02/03/19.
//  Copyright © 2019 apple. All rights reserved.
//

import Foundation
import UIKit
class AlertView:UIView{
    //our singleton object reference
    static let instance = AlertView()
    @IBOutlet var containerView: UIView!
    @IBOutlet weak var alertImage: UIImageView!
    @IBOutlet weak var titleAlertLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var alertButton: UIButton!
    override init(frame: CGRect) {
        super.init(frame: frame)
        Bundle.main.loadNibNamed("AlertView", owner: self, options: nil)
        self.commonUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    enum AlertType{
        case success
        case failure
    }
    func showAlert(title:String, message: String, type: AlertType){
        self.titleAlertLabel.text = title
        self.messageLabel.text = message
        switch type {
        case .success:
            alertImage.image = UIImage(named: "ok_cool")
            alertButton.backgroundColor = UIColor(red: 0, green: 245/255, blue: 11/245, alpha: 1.0)
            alertButton.setTitle("Continue", for: .normal)
        case .failure:
            alertImage.image = UIImage(named: "ok_nocool")
            alertButton.backgroundColor = UIColor(red: 195/255, green: 0, blue: 53/245, alpha: 1.0)
            alertButton.setTitle("Annuler", for: .normal)
        default:
            print("things didn't work properly")
        }
        UIApplication.shared.keyWindow?.addSubview(containerView)
    }
    
    func commonUI(){
        self.containerView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        self.containerView.autoresizingMask = [.flexibleHeight,.flexibleWidth]
    }
    @IBAction func doneClicked(_ sender: Any) {
        self.containerView.removeFromSuperview()
    }
}
