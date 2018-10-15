//
//  SecondViewController.swift
//  breakPoint
//
//  Created by Stephen Reyes on 8/13/18.
//  Copyright © 2018 Stephen Reyes. All rights reserved.
//

import UIKit
import Firebase

class GroupsVC: UIViewController {
    
    @IBOutlet weak var groupsTableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        groupsTableView.dataSource = self
        groupsTableView.delegate = self
    }

    @IBAction func createNewgGroupBtnWasPressed(_ sender: Any) {
       // let CreateGroupsVC = storyboard?.instantiateInitialViewController("CreateGroupsVC")
        // present(CreateGroupsVC, animated: true, completion: nil)
    }
}

extension GroupsVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = groupsTableView.dequeueReusableCell(withIdentifier: "groupCell") as? GroupCell else { return UITableViewCell()}
        cell.configureGroupCell(title: "Jonh Cena", description: "A group that cannot be seen.", memberCount: 4)
        return cell
    }
}

