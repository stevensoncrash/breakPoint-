//
//  ShadowView.swift
//  breakPoint
//
//  Created by Stephen Reyes on 8/16/18.
//  Copyright © 2018 Stephen Reyes. All rights reserved.
//

import UIKit

class ShadowView: UIView {
    
    override func awakeFromNib() {
        self.layer.shadowOpacity = 0.75
        self.layer.shadowRadius = 5.0
        self.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        super.awakeFromNib()
    }
}
