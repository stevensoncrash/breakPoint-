//
//  CreateGroupsVC.swift
//  breakPoint
//
//  Created by Stephen Reyes on 10/10/18.
//  Copyright © 2018 Stephen Reyes. All rights reserved.
//

import UIKit

class CreateGroupsVC: UIViewController {
    
    @IBOutlet weak var titleTextField: InsetTextfield!
    @IBOutlet weak var descriptionTextField: InsetTextfield!
    @IBOutlet weak var emailSearchTextField: InsetTextfield!
    
    @IBOutlet weak var groupMembersLbl: UIStackView!
    @IBOutlet weak var doneBtn: UIButton!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func closeBtn(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func DoneBtnPressed(_ sender: UIButton) {
    }
}
