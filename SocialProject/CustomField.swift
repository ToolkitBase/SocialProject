//
//  CustomField.swift
//  SocialProject
//
//  Created by Mark Wong on 8/20/16.
//  Copyright © 2016 Mark Wong. All rights reserved.
//

import UIKit

// this will help textField for email address/ password when you remove borders. 

class CustomField: UITextField {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.borderColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: 0.2).CGColor
        layer.borderWidth = 1.0
        
    }
    
    override func textRectForBounds(bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 10, dy: 5)
    }
    
    override func editingRectForBounds(bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 10, dy: 5)
    }
    

}
