//
//  DesignableButton.swift
//  CookingApp
//
//  Created by Raju Gupta on 17/04/20.
//  Copyright © 2020 Raju Gupta. All rights reserved.
//

import UIKit

@IBDesignable
class DesignableButton: UIButton {
    
    @IBInspectable var cornerRadius : CGFloat = 0 {
        didSet{
            layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderWidth : CGFloat = 0 {
        didSet{
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor : UIColor = .clear {
        didSet{
            layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var spacing:CGFloat = 0 {
        didSet {
            updateTitleLabel_()
        }
    }
    
    override func setTitle(_ title: String?, for state: UIControl.State)
    {
        if let title = title, spacing != 0
        {
            let color = super.titleColor(for: state) ?? UIColor.black
            let attributedTitle = NSAttributedString(
                string: title,
                attributes: [NSAttributedString.Key.kern: spacing,
                             NSAttributedString.Key.foregroundColor: color])
            super.setAttributedTitle(attributedTitle, for: state)
        }
        else
        {
            super.setTitle(title, for: state)
        }
    }

    fileprivate func updateTitleLabel_()
    {
        let states:[UIControl.State] = [.normal, .highlighted, .selected, .disabled]
        for state in states
        {
            let currentText = super.title(for: state)
            self.setTitle(currentText, for: state)
        }
    }
    
    
    
}
