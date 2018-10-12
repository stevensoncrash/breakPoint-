//
//  UserCell.swift
//  breakPoint
//
//  Created by Stephen Reyes on 10/11/18.
//  Copyright © 2018 Stephen Reyes. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var checkMarkImage: UIImageView!
    
    var showing = false
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            checkMarkImage.isHidden = false
        } else {
            checkMarkImage.isHidden = true
        }
    }

    func configureCell(profileImage image: UIImage, email: String, isSelected: Bool) {
        self.profileImage.image = image
        self.emailLbl.text = email
        if isSelected {
            if showing == false {
                 self.checkMarkImage.isHidden = false
                 showing = true
            }
        } else {
            self.checkMarkImage.isHidden = true
            showing = false
        }
    }
}
