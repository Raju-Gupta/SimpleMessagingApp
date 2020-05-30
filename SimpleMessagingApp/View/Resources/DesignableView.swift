//
//  DesignableView.swift
//  CookingApp
//
//  Created by Raju Gupta on 17/04/20.
//  Copyright © 2020 Raju Gupta. All rights reserved.
//

import UIKit

@IBDesignable
class DesignableView: UIView {
    
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
    
    //MARK :- Shadow View
    @IBInspectable var addShadow:Bool = true{
        
        didSet(newValue) {
            if(newValue == true){
                self.layer.masksToBounds = false
                //self.layer.masksToBounds = true
                self.layer.shadowColor = UIColor.white.cgColor
                self.layer.shadowOpacity = 1
                self.layer.shadowOffset = CGSize(width: -1, height: 1)
                self.layer.shadowRadius = 3
                
                self.layer.shadowPath = UIBezierPath(rect: bounds).cgPath
                self.layer.shouldRasterize = true
                self.layer.rasterizationScale =  UIScreen.main.scale
                // print("trying to use shadow")
            }
        }
        
    }
    
}
