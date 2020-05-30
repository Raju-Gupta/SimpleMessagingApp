//
//  TextFieldIconSetUp.swift
//  CookingApp
//
//  Created by Raju Gupta on 30/04/20.
//  Copyright © 2020 Raju Gupta. All rights reserved.
//

import UIKit

class TextFieldHelper{
    
    static var parentError: UILabel?
    static func textValidation(txt: UITextField, regex: String, error: String, errorLabel: UILabel){
        txt.accessibilityHint = regex
        txt.accessibilityLabel = error
        parentError = errorLabel
        txt.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    @objc static func textFieldDidChange(_ sender: UITextField){
        if regexValidation(text: sender.text!, regex: sender.accessibilityHint!){
            setRightViewSuccessIcon(textfield: sender.self)
            sender.isSelected = true
            parentError?.alpha = 0
        }
        else{
            setRightViewErrorIcon(textfield: sender.self)
            sender.isSelected = false
            parentError?.alpha = 1
            parentError?.text = sender.accessibilityLabel
        }
    }
    
    //MARK: - Setting Error icon to textFields
    static func setRightViewErrorIcon(textfield: UITextField) {
        let btnView = UIButton(frame: CGRect(x: 0, y: 0, width: ((textfield.frame.height) * 0.70), height: ((textfield.frame.height) * 0.70)))
        btnView.tintColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
        btnView.setImage(UIImage(systemName: "xmark.circle"), for: .normal)
        btnView.imageEdgeInsets = UIEdgeInsets(top: 0, left: -15, bottom: 0, right: 15)
        textfield.layer.borderColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
        textfield.rightViewMode = .always
        textfield.rightView = btnView
    }
    
    
    //MARK: - Setting Success icon to textFields
    static func setRightViewSuccessIcon(textfield: UITextField) {
        let btnView = UIButton(frame: CGRect(x: 0, y: 0, width: ((textfield.frame.height) * 0.70), height: ((textfield.frame.height) * 0.70)))
        btnView.tintColor = #colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1)
        btnView.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
        btnView.imageEdgeInsets = UIEdgeInsets(top: 0, left: -15, bottom: 0, right: 15)
        textfield.layer.borderColor = #colorLiteral(red: 0.6666666667, green: 0.6666666667, blue: 0.6666666667, alpha: 1)
        textfield.rightViewMode = .always
        textfield.rightView = btnView
    }
    
    //MARK: - validation based on regular exresstion
    static func regexValidation(text : String, regex: String) -> Bool {
        let textRegex = regex
        let trimmedString = text.trimmingCharacters(in: .whitespaces)
        let validateName = NSPredicate(format: "SELF MATCHES %@", textRegex)
        let isValidateText = validateName.evaluate(with: trimmedString)
        return isValidateText
    }
    
}
