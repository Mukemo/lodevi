//
//  LoginViewController.swift
//  lodevi
//
//  Created by apple on 24/12/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class LoginViewController: UIViewController, UITextFieldDelegate{
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    var activitiIndicator = UIActivityIndicatorView()
    override func viewDidLoad() {
        super.viewDidLoad()
        activitiIndicator.center = self.view.center
        activitiIndicator.hidesWhenStopped = true
        activitiIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.white
        self.view.addSubview(activitiIndicator)
        usernameTextField.attributedPlaceholder = NSAttributedString(string: "John Doe", attributes: [NSAttributedStringKey.foregroundColor: UIColor.lightGray])
        
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "secret", attributes: [NSAttributedStringKey.foregroundColor: UIColor.lightGray])
        usernameTextField.delegate = self
        passwordTextField.delegate = self
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    @IBAction func goToRegisterTapped(_ sender: Any) {
        if let registerViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RegisterViewController") as?  RegisterViewController {
            self.present(registerViewController, animated: true, completion: nil)
        }
    }
    @IBAction func loginButtonTapped(sender: UIButton){
        activitiIndicator.startAnimating()
        //print("abcd1234".data(using: .utf8)?.base64EncodedString() ?? nil)
        guard let name = usernameTextField.text, usernameTextField.text != "" else {
            AlertView.instance.showAlert(title: "Erreur", message: "Veuillez entrer le nom", type: .failure)
            activitiIndicator.stopAnimating()
            return
        }
        guard let password = passwordTextField.text, passwordTextField.text != "" else {
             AlertView.instance.showAlert(title: "Erreur", message: "Veuillez entrer le mot de passe", type: .failure)
            activitiIndicator.stopAnimating()
            return
        }
        
        AuthService.instance.login(username: name, password: password, completion: { Success in
            if Success{
                
                OperationQueue.main.addOperation {
                    self.activitiIndicator.stopAnimating()
                    self.performSegue(withIdentifier: "loginShow", sender: self)
               }
            }else{
                OperationQueue.main.addOperation {
                    self.activitiIndicator.stopAnimating()
                    AlertView.instance.showAlert(title: "Error", message: "Veuillez enter un email ou un mot de pass correct", type: .failure)
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
}
