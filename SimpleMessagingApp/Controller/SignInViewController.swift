//
//  SignInViewController.swift
//  SimpleMessagingApp
//
//  Created by Raju Gupta on 30/05/20.
//  Copyright © 2020 Raju Gupta. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet weak var lblErrorMessage: UILabel!
    @IBOutlet weak var txtEmail: DesignableTextField!
    @IBOutlet weak var txtPassword: DesignableTextField!
    @IBOutlet weak var btnSignIn: DesignableButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldValidation()
    }
    
    @IBAction func onClickSignIn(_ sender: UIButton) {
    }
}

//MARK:- Validation
extension SignInViewController{
    func textFieldValidation(){
        btnSignIn.isEnabled = false
        
        TextFieldHelper.textValidation(txt: txtEmail, regex: RegExManager.emailRegex, error: ErrorMessages.emailError, errorLabel: lblErrorMessage)
        TextFieldHelper.textValidation(txt: txtPassword, regex: RegExManager.passwordRegex, error: ErrorMessages.passwordError, errorLabel: lblErrorMessage)
        
        txtEmail.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        txtPassword.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    @objc func textFieldDidChange(_ sender: UITextField){
        if txtEmail.isSelected == true && txtPassword.isSelected == true{
            btnSignIn.alpha = 1
            btnSignIn.isEnabled = true
        }
        else{
            btnSignIn.alpha = 0.5
            btnSignIn.isEnabled = false
        }
    }
}
