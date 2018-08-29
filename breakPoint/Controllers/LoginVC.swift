//
//  LoginVC.swift
//  breakPoint
//
//  Created by Stephen Reyes on 8/28/18.
//  Copyright © 2018 Stephen Reyes. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    
    @IBOutlet weak var emailField: InsetTextfield!
    

    @IBOutlet weak var passwordField: InsetTextfield!
    override func viewDidLoad() {
        super.viewDidLoad()
        emailField.delegate = self as? UITextFieldDelegate
        passwordField.delegate = self as? UITextFieldDelegate

        // Do any additional setup after loading the view.
    }

    
    @IBAction func signInbtnWasPressed(_ sender: Any) {
        if emailField.text != nil && passwordField.text != nil {
            AuthService.instance.loginUser(withEmail: emailField.text!, andPassword: passwordField.text!) { (success, loginError) in
                if success {
                    self.dismiss(animated: true, completion: nil)
                } else {
                    print(String(describing: loginError?.localizedDescription))
                }
                AuthService.instance.registerUser(withEmail: self.emailField.text!, andPassword: self.passwordField.text!, userCreationComplete: { (success, registrationError) in
                    if success {
                        AuthService.instance.loginUser(withEmail: self.emailField.text!, andPassword: self.passwordField.text!, loginComplete: { (success, nil) in
                            self.dismiss(animated: true, completion: nil)
                            if success {
                                print("successfully registered user!")
                            } else {
                                print(String(describing: registrationError?.localizedDescription))
                            }
                        })
                    }
                })
            }
        }
    }
    
    @IBAction func closedBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension LoginVC: UITextViewDelegate {
    
}
