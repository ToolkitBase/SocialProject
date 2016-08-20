//
//  RoundBtn.swift
//  SocialProject
//
//  Created by Mark Wong on 8/20/16.
//  Copyright © 2016 Mark Wong. All rights reserved.
//

import UIKit

class RoundBtn: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.shadowColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: 0.6).CGColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        imageView?.contentMode = .ScaleAspectFit
        
        /* slightly curved corner
 
         layer.cornerRadius = 5.0
 
        */
        
    }
    
    //perfectly round means we have to calculate based on width. width of frame hasn't been calculated yet if you did it from nib, so we put it in layoutSubviews(). frame size has been worked out in layout Subviews.
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = self.frame.width / 2
        
    }
    
    
    
}
