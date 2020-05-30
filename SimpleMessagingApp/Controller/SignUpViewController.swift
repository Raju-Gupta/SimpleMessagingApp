//
//  ViewController.swift
//  SimpleMessagingApp
//
//  Created by Raju Gupta on 30/05/20.
//  Copyright © 2020 Raju Gupta. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var lblErrorMessage: UILabel!
    @IBOutlet weak var txtName: DesignableTextField!
    @IBOutlet weak var txtEmail: DesignableTextField!
    @IBOutlet weak var txtPassword: DesignableTextField!
    @IBOutlet weak var btnSignUp: DesignableButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldValidation()
    }

    @IBAction func onClickBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onClickSignUp(_ sender: UIButton) {
    }
}


//MARK:- Validation
extension SignUpViewController{
    func textFieldValidation(){
        btnSignUp.isEnabled = false
        
        TextFieldHelper.textValidation(txt: txtName, regex: RegExManager.nameRegex, error: ErrorMessages.nameError, errorLabel: lblErrorMessage)
        TextFieldHelper.textValidation(txt: txtEmail, regex: RegExManager.emailRegex, error: ErrorMessages.emailError, errorLabel: lblErrorMessage)
        TextFieldHelper.textValidation(txt: txtPassword, regex: RegExManager.passwordRegex, error: ErrorMessages.passwordError, errorLabel: lblErrorMessage)
        
        txtName.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        txtEmail.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        txtPassword.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    @objc func textFieldDidChange(_ sender: UITextField){
        if txtName.isSelected == true && txtEmail.isSelected == true && txtPassword.isSelected == true{
            btnSignUp.alpha = 1
            btnSignUp.isEnabled = true
        }
        else{
            btnSignUp.alpha = 0.5
            btnSignUp.isEnabled = false
        }
    }
}

