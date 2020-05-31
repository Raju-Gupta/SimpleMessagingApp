//
//  ChatUserViewController.swift
//  SimpleMessagingApp
//
//  Created by Raju Gupta on 30/05/20.
//  Copyright © 2020 Raju Gupta. All rights reserved.
//

import UIKit
import IHProgressHUD
import FirebaseDatabase

class ChatUserViewController: UIViewController {

    @IBOutlet weak var chatTableView: UITableView!
    
    var allUsers = [UserDataModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cellRegistation()
        IHProgressHUD.set(defaultStyle: .dark)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getAllUser()
    }
    
    func cellRegistation(){
        let nibName = UINib(nibName: "UserCell", bundle: nil)
        chatTableView.register(nibName, forCellReuseIdentifier: "UserCell")
    }
    
    //MARK:- Get All Users
    func getAllUser(){
        allUsers.removeAll()
        IHProgressHUD.show()
        UserDataManager.getAllUsers { (allUser) in
            self.allUsers = allUser
            self.chatTableView.reloadData()
            IHProgressHUD.dismiss()
        }
    }

}

extension ChatUserViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allUsers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as! UserCell
        let imgStr = allUsers[indexPath.row].avatar
        if imgStr != ""{
            cell.imgAvatar.image = DataConvertion.convertBase64StringToImage(imageBase64String: imgStr)
        }
        cell.lblName.text = allUsers[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = storyboard?.instantiateViewController(identifier: "ChattingViewController") as! ChattingViewController
        vc.recieverUser = allUsers[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
