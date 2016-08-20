//
//  CustomView.swift
//  SocialProject
//
//  Created by Mark Wong on 8/19/16.
//  Copyright © 2016 Mark Wong. All rights reserved.
//

import UIKit

class CustomView: UIView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.shadowColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: 0.6).CGColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        
    }

}
