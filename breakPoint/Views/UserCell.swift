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
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configureCell(profileImage image: UIImage, email: String, isSelected: Bool) {
        self.profileImage.image = image
        self.emailLbl.text = email
        if isSelected {
            self.checkMarkImage.isHidden = false
        } else {
            self.checkMarkImage.isHidden = true
        }
    }
}
