//
//  RegisterViewController.swift
//  lodevi
//
//  Created by apple on 24/12/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var telephoneTextField: UITextField!
    

    override func viewDidLoad() {
       
        usernameTextField.attributedPlaceholder = NSAttributedString(string: "John Doe", attributes: [NSAttributedStringKey.foregroundColor: UIColor.lightGray])
        telephoneTextField.attributedPlaceholder = NSAttributedString(string: "243 90000000", attributes: [NSAttributedStringKey.foregroundColor: UIColor.lightGray])
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "secret", attributes: [NSAttributedStringKey.foregroundColor: UIColor.lightGray])
    }
    
    /*@IBAction func countryButtonTapped(sender: UIButton){
        if containerView.isHidden == true {
            
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn, animations: {
                self.containerView.isHidden = false
            }, completion: nil)
        }
    }*/
    
    @IBAction func resgisterButtonTapped(sender: UIButton){
        guard let name = usernameTextField.text, usernameTextField.text != "" else {
            OperationQueue.main.addOperation {
                self.showAlert(with: "Erreur", message: "Veuillez entrer le nom")
            }
            return
        }
        
        guard let password = passwordTextField.text, passwordTextField.text != "" else{
            OperationQueue.main.addOperation {
              self.showAlert(with: "Erreur", message: "Veuillez entrer le mot de passe")
            }
            return
        }
        guard let tel = telephoneTextField.text, telephoneTextField.text != "" else {
            OperationQueue.main.addOperation {
                self.showAlert(with: "Erreur", message: "Veuillez entrer le numero de telephone")
            }
            return
        }
        
        AuthService.instance.registerUser(username: name, password: password, telephone: tel, completion: { Success in
            if Success {
//                AuthService.instance.logIn(email: email, password: pass, completion: { Success in
//                    if Success {
//                        self.dismiss(animated: true, completion: nil)
//                    } else {
//                        OperationQueue.main.addOperation {
//                            self.showAlert(with: "Error", message: "Incorrect Password")
//                        }
//                    }
//                })
                
                
                OperationQueue.main.addOperation {
                    self.showAlert(with: "Cool", message: "You have succeeded")
                }
            } else {
                OperationQueue.main.addOperation {
                    self.showAlert(with: "Error", message: "An Unknown Error occurred saving the account")
                }
            }
        })
    }
    /*@IBAction func closeButtonTapped(sender: UIButton){
        //self.innerView.isHidden = true
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn, animations: { 
            self.containerView.isHidden = true
        }, completion: nil)
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
      let touch = touches.first
        if touch!.view == self.innerView {
            if self.containerView.isHidden == false {
                //self.containerView.isHidden = true
                UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn, animations: {
                    self.containerView.isHidden = true
                }, completion: nil)
            }
        }
    }*/
    
    func showAlert(with title: String?, message: String?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
}
/*extension RegisterViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryViewCell", for: indexPath) as? CountryViewCell
        return cell!
    }

}*/







