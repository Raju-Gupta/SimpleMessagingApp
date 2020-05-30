//
//  DesignableTextView.swift
//  CookingApp
//
//  Created by Raju Gupta on 24/04/20.
//  Copyright © 2020 Raju Gupta. All rights reserved.
//

import UIKit

@IBDesignable
class DesignableTextView: UITextView {

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
    
    @IBInspectable var padding : CGFloat = 0{
        didSet{
            textViewPadding(Padding: padding)
        }
    }
    
    
    func textViewPadding(Padding: CGFloat){
        textContainerInset = UIEdgeInsets(top: Padding, left: Padding, bottom: 0, right: 0)
    }
}

