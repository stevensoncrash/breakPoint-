//
//  AuthVC.swift
//  breakPoint
//
//  Created by Stephen Reyes on 8/16/18.
//  Copyright © 2018 Stephen Reyes. All rights reserved.
//

import UIKit
import Firebase

class AuthVC: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional  setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if Auth.auth().currentUser != nil {
        dismiss(animated: true, completion: nil)
        }
    }

    @IBAction func signInByEmailWasPressed(_ sender: Any) {
        let loginVC = storyboard?.instantiateViewController(withIdentifier: "LoginVC")
        present(loginVC!, animated: true, completion: nil)
    }
    
    @IBAction func twitterSignInWasPressed(_ sender: Any) {
        //let twitterVC = storyboard?.instantiateViewController(withIdentifier: "GoogleVC")
        //present(googleVC, animated: true, completion: nil)
    }
    
    @IBAction func facebookSignInBtnWasPressed(_ sender: Any) {
        //let fbLoginVC = storyboard?.instantiateViewController(withIdentifier: "FBLoginVC")
        //present(fbLoginVC, animated: true, completion: nil)
    }
}
