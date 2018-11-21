//
//  GroupFeedCell.swift
//  breakPoint
//
//  Created by Stephen Reyes on 10/15/18.
//  Copyright © 2018 Stephen Reyes. All rights reserved.
//

import UIKit

class GroupFeedCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var contentLbl: UILabel!
    
    func configureCell(profileImage image: UIImage, emailLbl email: String, contentLbl content: String){
        self.profileImage.image = image
        self.emailLbl.text = email
        self.contentLbl.text = content
    }
}
