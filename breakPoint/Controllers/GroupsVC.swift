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
    
    var groupArray = [Group]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        groupsTableView.dataSource = self
        groupsTableView.delegate = self
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super .viewDidAppear(animated)
        DataService.instance.REF_GROUPS.observe(.value) { (snapShot) in
            DataService.instance.getAllGroups { (returnedGroupArray) in
                self.groupArray = returnedGroupArray.reversed()
                self.groupsTableView.reloadData()
            }
        }
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
        return groupArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = groupsTableView.dequeueReusableCell(withIdentifier: "groupCell") as? GroupCell else { return UITableViewCell()}
        let group = groupArray[indexPath.row]
        cell.configureGroupCell(title: group.groupTitle, description: group.groupDesc, memberCount: group.memberCount)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let groupFeedVC = storyboard?.instantiateViewController(withIdentifier: "GroupFeedVC") as? GroupFeedVC else {return}
        groupFeedVC.initData(forGroup: groupArray[indexPath.row])
        presentDetail(groupFeedVC)
    }
}

