//
//  DesignableLetterSpacing.swift
//  CookingApp
//
//  Created by Raju Gupta on 17/04/20.
//  Copyright © 2020 Raju Gupta. All rights reserved.
//

import UIKit

@IBDesignable
class DesignableLetterSpacing: UILabel {

    @IBInspectable open var characterSpacing:CGFloat = 0 {
        didSet {
            updateWithSpacing()
        }

    }

    open override var text: String? {
        set {
            super.text = newValue
            updateWithSpacing()
        }
        get {
            return super.text
        }
    }
    
    open override var attributedText: NSAttributedString? {
        set {
            super.attributedText = newValue
            updateWithSpacing()
        }
        get {
            return super.attributedText
        }
    }
    
    func updateWithSpacing() {
        let attributedString = self.attributedText == nil ? NSMutableAttributedString(string: self.text ?? "") : NSMutableAttributedString(attributedString: attributedText!)
        attributedString.addAttribute(NSAttributedString.Key.kern, value: self.characterSpacing, range: NSRange(location: 0, length: attributedString.length))
        super.attributedText = attributedString
    }

}

