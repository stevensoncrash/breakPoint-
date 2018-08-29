//
//  MeVC.swift
//  breakPoint
//
//  Created by Stephen Reyes on 8/29/18.
//  Copyright © 2018 Stephen Reyes. All rights reserved.
//

import UIKit

class MeVC: UIViewController {
    
  
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signOutBtnWasPressed(_ sender: Any) {
        //sign out code ...
    }
}
