//
//  LoginViewController.swift
//  lodevi
//
//  Created by apple on 24/12/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTextField.attributedPlaceholder = NSAttributedString(string: "John Doe", attributes: [NSAttributedStringKey.foregroundColor: UIColor.lightGray])
        
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "secret", attributes: [NSAttributedStringKey.foregroundColor: UIColor.lightGray])
    }

    @IBAction func loginButtonTapped(sender: UIButton){
        print("abcd1234".data(using: .utf8)?.base64EncodedString() ?? nil)
        guard let name = usernameTextField.text, usernameTextField.text != "" else {
            self.showAlert(with: "Erreur", message: "Veuillez entrer le nom")
            return
        }
        guard let password = passwordTextField.text, passwordTextField.text != "" else {
            self.showAlert(with: "Erreur", message: "Veuillez entrer le mot de passe")
            return
        }
        AuthService.instance.login(username: name, password: password, completion: { Success in
            if Success{
                
                OperationQueue.main.addOperation {
                    self.performSegue(withIdentifier: "loginShow", sender: self)
               }
            }else{
                OperationQueue.main.addOperation {
                    self.showAlert(with: "Erreur", message: "Veuillez verifier votre mot de passe")
                }
            }
        })
    }
    
    func showAlert(with title: String?, message: String?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
//    override func viewDidAppear(_ animated: Bool) {
////        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
////        if let pageViewController = storyBoard.instantiateViewController(withIdentifier: "WalktrhoughVC") as? WalktrhoughVC {
////            present(pageViewController, animated: true, completion: nil)
////        }
//    }
}
