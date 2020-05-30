//
//  DesignableImageView.swift
//  CookingApp
//
//  Created by Raju Gupta on 19/04/20.
//  Copyright © 2020 Raju Gupta. All rights reserved.
//

import UIKit

@IBDesignable
class DesignableImageView: UIImageView {

    @IBInspectable var borderWidth : CGFloat = 0{
        didSet{
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor : UIColor = .clear{
        didSet{
            layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var cornerRadius : CGFloat = 0{
        didSet{
            layer.cornerRadius = cornerRadius
        }
    }
}
