//
//  UpdateProfileViewController.swift
//  SimpleMessagingApp
//
//  Created by Raju Gupta on 30/05/20.
//  Copyright © 2020 Raju Gupta. All rights reserved.
//

import UIKit

class UpdateProfileViewController: UIViewController {

    @IBOutlet weak var imgAvatar: DesignableImageView!
    @IBOutlet weak var lblErrorMessage: UILabel!
    @IBOutlet weak var txtName: DesignableTextField!
    @IBOutlet weak var btnUpdate: DesignableButton!
    
    let imagePicker = UIImagePickerController()
    var avatar : UIImage?
    var name : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSetUp()
        textFieldValidation()
        uploadImage()
    }
    
    func viewSetUp(){
        if avatar != nil && avatar?.isSymbolImage != true {
            imgAvatar.image = avatar
        }
        txtName.text = name
    }
    
    @IBAction func onClickBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onClickUpdate(_ sender: Any) {
        var imgStr = ""
        if imgAvatar.image != nil{
            imgStr = DataConvertion.convertImageToBase64String(img: imgAvatar.image!)
        }
        let userData = UserDataModel(Uname: txtName.text!, Uemail: UserDefaultManager.userEmail, Uavatar: imgStr, UuserId: UserDefaultManager.userId)
        UserDataManager.setUserData(userData: userData, userId: UserDefaultManager.userId)
        navigationController?.popViewController(animated: true)
    }
}

//MARK:- Validation
extension UpdateProfileViewController{
    
    func textFieldValidation(){
        TextFieldHelper.textValidation(txt: txtName, regex: RegExManager.nameRegex, error: ErrorMessages.nameError, errorLabel: lblErrorMessage)
        txtName.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    @objc func textFieldDidChange(_ sender: UITextField){
        if txtName.isSelected == true{
            btnUpdate.alpha = 1
            btnUpdate.isEnabled = true
        }
        else{
            btnUpdate.alpha = 0.5
            btnUpdate.isEnabled = false
        }
    }
}

//MARK:- Image Uploading
extension UpdateProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
 
    //Mark: - Adding Tap Gesture to the profile image view.
    func uploadImage(){
        let tap = UITapGestureRecognizer()
        tap.addTarget(self, action: #selector(openGallery(_:)))
        imgAvatar.isUserInteractionEnabled = true
        imgAvatar.addGestureRecognizer(tap)
    }
    
    @objc func openGallery(_ tapgesture : UITapGestureRecognizer){
        setUpImagePicker()
    }
    
    func setUpImagePicker(){
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            imagePicker.sourceType = .savedPhotosAlbum
            imagePicker.delegate = self
            imagePicker.isEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    //Mark: - UIImagePickerControllerDelegate function
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let img = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        imgAvatar.image = img
        self.dismiss(animated: true, completion: nil)
    }
}
