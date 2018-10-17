//
//  GroupFeedVC.swift
//  breakPoint
//
//  Created by Stephen Reyes on 10/15/18.
//  Copyright © 2018 Stephen Reyes. All rights reserved.
//

import UIKit
import Firebase

class GroupFeedVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var groupTitleLbl: UILabel!
    @IBOutlet weak var sendBtnView: UIView!
    @IBOutlet weak var messageTextField: InsetTextfield!
    @IBOutlet weak var sendBtn: UIButton!
    @IBOutlet weak var memberLbl: UILabel!
    
    var group: Group?
    var groupMessages = [Message]()
    
    func initData(forGroup group: Group){
        self.group = group
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        groupTitleLbl.text = group?.groupTitle
        memberLbl.text = group?.members.joined(separator: ", ")
        DataService.instance.getEmailsFor(group: group!) { (returnedEmails) in
            self.memberLbl.text = returnedEmails.joined(separator: ", ")
        }
        DataService.instance.REF_GROUPS.observe(.value) { (snapshot) in
            DataService.instance.getAllMessagesFor(desiredGroup: self.group!, handler: { (returnedGroupMessages) in
                self.groupMessages = returnedGroupMessages
                self.tableView.reloadData()
                
                if self.groupMessages.count > 0 {
                    self.tableView.scrollToRow(at: IndexPath(row: self.groupMessages.count - 1 , section: 0), at: .none, animated: true)
                }
            })
        }
    }
    override func viewDidLoad() {
        sendBtnView.bindToKeyBoard()
        tableView.delegate = self
        tableView.dataSource = self
        super.viewDidLoad()
 }
    @IBAction func sendBtnWasPressed(_ sender: Any) {
        if messageTextField.text != "" {
            messageTextField.isEnabled = false
            sendBtn.isEnabled = false
            DataService.instance.uploadPost(withMessage: messageTextField.text!, forUID: (Auth.auth().currentUser?.uid)!, forGroupKey: group?.key) { (complete) in
                if complete {
                    self.messageTextField.text = ""
                    self.messageTextField.isEnabled = true
                    self.sendBtn.isEnabled = true
                   
                }
            }
        }
    }
    
    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension GroupFeedVC: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupMessages.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "groupFeedCell", for: indexPath) as? GroupFeedCell else { return UITableViewCell()}
        let message = groupMessages[indexPath.row]
        DataService.instance.getUserName(uid: message.senderId) { (email) in
            cell.configureCell(profileImage: UIImage(named: "defaultProfileImage")!, emailLbl: email , contentLbl: message.content)
        }
        return cell
    }
}
