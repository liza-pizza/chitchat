//
//  LoginViewController.swift
//  chitchat
//
//  Created by Liza Bipin on 14/08/21.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBAction func loginPressed(_ sender: Any) {
        
        if let email = emailTextfield.text, let password = passwordTextfield.text{
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
                
                if let e = error{
                    let alert = UIAlertController().alert(with: e)
                    self?.present(alert, animated: true, completion: nil)
                }
                else
                {
                    self?.performSegue(withIdentifier: K.loginSegue, sender: self)
                }
                
            }
        }
    }
}
