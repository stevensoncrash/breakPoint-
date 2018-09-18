//
//  FeedCell.swift
//  breakPoint
//
//  Created by Stephen Reyes on 9/18/18.
//  Copyright © 2018 Stephen Reyes. All rights reserved.
//

import UIKit

class FeedCell: UITableViewCell {

    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var contentLbl: UILabel!
    
    func configureCell(profileImage: UIImage, email: String, content: String){
        self.profileImage.image = profileImage
        self.emailLbl.text = email
        self.contentLbl.text = content
    }

}
