//
//  GroupCell.swift
//  breakPoint
//
//  Created by Stephen Reyes on 10/14/18.
//  Copyright © 2018 Stephen Reyes. All rights reserved.
//

import UIKit

class GroupCell: UITableViewCell {
    
    @IBOutlet weak var grouptitleLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var memberCountLbl: UILabel!
    
    func configureGroupCell(title: String, description: String, memberCount: Int){
        self.grouptitleLbl.text = title
        self.descriptionLbl.text = description
        self.memberCountLbl.text = "\(memberCount)members."
    }
}
