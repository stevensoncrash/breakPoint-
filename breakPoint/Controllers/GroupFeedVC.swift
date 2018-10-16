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
