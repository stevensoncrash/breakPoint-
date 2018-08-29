//
//  AuthVC.swift
//  breakPoint
//
//  Created by Stephen Reyes on 8/16/18.
//  Copyright © 2018 Stephen Reyes. All rights reserved.
//

import UIKit

class AuthVC: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional  setup after loading the view.
    }

    @IBAction func signInByEmailWasPressed(_ sender: Any) {
        let loginVC = storyboard?.instantiateViewController(withIdentifier: "LoginVC")
        present(loginVC!, animated: true, completion: nil)
    }
    
    @IBAction func googleSignInBtnWasPressed(_ sender: Any) {
        //let googleVC = storyboard?.instantiateViewController(withIdentifier: "GoogleVC")
        //present(googleVC, animated: true, completion: nil)
    }
    
    @IBAction func facebookSignInBtnWasPressed(_ sender: Any) {
        //let fbLoginVC = storyboard?.instantiateViewController(withIdentifier: "FBLoginVC")
        //present(fbLoginVC, animated: true, completion: nil)
    }
}
