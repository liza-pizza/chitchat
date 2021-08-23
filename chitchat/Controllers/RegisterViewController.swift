//
//  RegisterViewController.swift
//  chitchat
//
//  Created by Liza Bipin on 14/08/21.
//

import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBAction func registerPressed(_ sender: Any) {
        
        //email and password cannot be nil so unwrapping using if let
        
        if let email = emailTextField.text, let password = passwordTextfield.text{
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                
                if let e = error{
                    
                    let alert = UIAlertController().alert(with: e)
                    self.present(alert, animated: true, completion: nil)
                    
                }else {
                    
                    self.performSegue(withIdentifier: "RegisterToChat", sender: self)
                }
            }
            
        }
        
    }
    
    
    
}
