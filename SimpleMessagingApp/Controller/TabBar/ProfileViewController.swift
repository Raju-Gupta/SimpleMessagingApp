//
//  ProfileViewController.swift
//  SimpleMessagingApp
//
//  Created by Raju Gupta on 30/05/20.
//  Copyright © 2020 Raju Gupta. All rights reserved.
//

import UIKit
import FirebaseAuth

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var imgAvatar: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        userDataSetUp()
    }
    
    @IBAction func onClickEdit(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "UpdateProfileViewController") as! UpdateProfileViewController
        vc.avatar = imgAvatar.image
        vc.name = lblName.text
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func onClickLogOut(_ sender: Any) {
        let alert = UIAlertController(title: "Log Out", message: "Are you sure?, you want logout.", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        let yes = UIAlertAction(title: "Yes", style: .default) { (yesAction) in
            
            UserDefaultManager.removeAll()
            try! Auth.auth().signOut()
            
            let vc = self.storyboard?.instantiateViewController(identifier: "SignInViewController") as! SignInViewController
            let navVc = UINavigationController(rootViewController: vc)
            navVc.navigationBar.setBackgroundImage(UIImage(), for: .default)
            navVc.navigationBar.shadowImage = UIImage()
            navVc.navigationBar.isTranslucent = true
            let appDel = UIApplication.shared.delegate as? AppDelegate
            appDel?.window?.rootViewController = navVc
        }
        alert.addAction(cancel)
        alert.addAction(yes)
        self.present(alert, animated: true, completion: nil)
    }
}

//MARK:- Data Set Up
extension ProfileViewController{
    
    func userDataSetUp(){
        
        UserDataManager.getUserData(userId: UserDefaultManager.userId) { (userData) in
            let avatarStr = userData.avatar
            if avatarStr != ""{
                self.imgAvatar.image = DataConvertion.convertBase64StringToImage(imageBase64String: avatarStr)
            }
            self.lblName.text = userData.name
        }
    }
}
