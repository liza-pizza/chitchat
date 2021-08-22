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
                    
                    //when error is generated generate an alert
                    
                    let alert = UIAlertController(title: "Oh no, something went wrong!", message: e.localizedDescription, preferredStyle: .alert)
                    
                    
                    alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                                                    print(e.localizedDescription)
                    }))
                    
                    self.present(alert, animated: true, completion: nil)
                    
                    
                }else {
                    
                    self.performSegue(withIdentifier: "RegisterToChat", sender: self)
                    
                }
            }
            
        }
        
    }
    
    
    
}
