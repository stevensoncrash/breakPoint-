//
//  CreateGroupsVC.swift
//  breakPoint
//
//  Created by Stephen Reyes on 10/10/18.
//  Copyright © 2018 Stephen Reyes. All rights reserved.
//

import UIKit
import Firebase

class CreateGroupsVC: UIViewController {
    
    @IBOutlet weak var titleTextField: InsetTextfield!
    @IBOutlet weak var descriptionTextField: InsetTextfield!
    @IBOutlet weak var emailSearchTextField: InsetTextfield!
    
    @IBOutlet weak var groupMembersLbl: UIStackView!
    @IBOutlet weak var doneBtn: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self

        // Do any additional setup after loading the view.
    }

    @IBAction func closeBtn(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func DoneBtnPressed(_ sender: UIButton) {
        //do something that would confirm a new group is made and then procede to post new group instantly in the view.
    }
}

extension CreateGroupsVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "userCell") as? UserCell else { return UITableViewCell() }
        let profileImage = UIImage(named: "defaultProfileImage")
        
        cell.configureCell(profileImage: profileImage!, email: "peter@parker.com", isSelected: true)
        return cell
   }
 }
