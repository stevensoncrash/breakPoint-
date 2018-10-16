//
//  GroupFeedVC.swift
//  breakPoint
//
//  Created by Stephen Reyes on 10/15/18.
//  Copyright © 2018 Stephen Reyes. All rights reserved.
//

import UIKit

class GroupFeedVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var groupTitleLbl: UILabel!
    @IBOutlet weak var sendBtnView: UIView!
    @IBOutlet weak var messageTextField: InsetTextfield!
    @IBOutlet weak var sendBtn: UIButton!
    @IBOutlet weak var memberLbl: UILabel!
    
    var group: Group?
    
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
    }
    
    override func viewDidLoad() {
        sendBtnView.bindToKeyBoard()
        super.viewDidLoad()
        
        
        
        
 }
    @IBAction func sendBtnWasPressed(_ sender: Any) {
    }
    
    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
