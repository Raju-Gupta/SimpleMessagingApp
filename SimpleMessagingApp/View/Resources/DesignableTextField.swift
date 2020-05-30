//
//  DesignableTextFieldPlaceHolder.swift
//  CookingApp
//
//  Created by Raju Gupta on 17/04/20.
//  Copyright © 2020 Raju Gupta. All rights reserved.
//

import UIKit

@IBDesignable
class DesignableTextField: UITextField {
    
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
    
    @IBInspectable var spacing : CGFloat = 0{
        didSet{
            addPlaceholderSpacing(spacing: spacing)
        }
    }
    
    @IBInspectable var LeftPadding : CGFloat = 0{
        didSet{
            setLeftPaddingPoints(amount: LeftPadding)
        }
    }
    
    func setLeftPaddingPoints(amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    
    func addPlaceholderSpacing(spacing: CGFloat){
        let attributedString = NSMutableAttributedString(string: self.placeholder!)
        attributedString.addAttribute(NSAttributedString.Key.kern, value: spacing, range: NSRange(location: 0, length: self.placeholder!.count))
        self.attributedPlaceholder = attributedString
    }
    
    
}
