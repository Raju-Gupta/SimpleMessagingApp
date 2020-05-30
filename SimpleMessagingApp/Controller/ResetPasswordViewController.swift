//
//  ResetPasswordViewController.swift
//  SimpleMessagingApp
//
//  Created by Raju Gupta on 30/05/20.
//  Copyright © 2020 Raju Gupta. All rights reserved.
//

import UIKit
import FirebaseAuth

class ResetPasswordViewController: UIViewController {
    
    @IBOutlet weak var lblErrorMessage: UILabel!
    @IBOutlet weak var txtEmail: DesignableTextField!
    @IBOutlet weak var btnReset: DesignableButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldValidation()
    }
    
    @IBAction func onClickBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onClickReset(_ sender: UIButton) {
        Auth.auth().sendPasswordReset(withEmail: txtEmail.text!) { (error) in
            if error != nil{
                self.defaultAlert(title: "Failed To Reset", message: error!.localizedDescription)
            }
            else{
                self.defaultAlert(title: "Reset Link send successfully", message: "We have just send you a password reset email. Please check your inbox and follow the instructions to reset you password.")
            }
        }
    }
    
    
}

//MARK:- Validation
extension ResetPasswordViewController{
    func textFieldValidation(){
        btnReset.isEnabled = false
        
        TextFieldHelper.textValidation(txt: txtEmail, regex: RegExManager.emailRegex, error: ErrorMessages.emailError, errorLabel: lblErrorMessage)
        
        txtEmail.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    @objc func textFieldDidChange(_ sender: UITextField){
        if txtEmail.isSelected == true{
            btnReset.alpha = 1
            btnReset.isEnabled = true
        }
        else{
            btnReset.alpha = 0.5
            btnReset.isEnabled = false
        }
    }
}

