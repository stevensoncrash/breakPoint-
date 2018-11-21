//
//  MeVC.swift
//  breakPoint
//
//  Created by Stephen Reyes on 8/29/18.
//  Copyright © 2018 Stephen Reyes. All rights reserved.
//

import UIKit
import Firebase

class MeVC: UIViewController {
    
  
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.emailLbl.text = Auth.auth().currentUser?.email
    }

    @IBAction func signOutBtnWasPressed(_ sender: Any) {
        let logoutPopup = UIAlertController(title: "logout", message: "are you sure you want to log out?", preferredStyle: .actionSheet)
        let logoutAction = UIAlertAction(title: "logout", style: .destructive) { (buttonTapped) in
            do {
                try Auth.auth().signOut()
                let AuthVC = self.storyboard?.instantiateViewController(withIdentifier: "AuthVC") as? AuthVC
                self.present(AuthVC!, animated: true, completion: nil)
            } catch {
               print(error)
            }
        }
        logoutPopup.addAction(logoutAction)
        present(logoutPopup, animated: true, completion: nil)
    }
}
