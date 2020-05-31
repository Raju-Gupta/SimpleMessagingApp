//
//  ChattingViewController.swift
//  SimpleMessagingApp
//
//  Created by Raju Gupta on 31/05/20.
//  Copyright © 2020 Raju Gupta. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ChattingViewController: UIViewController {
    
    @IBOutlet weak var messageTableView: UITableView!
    @IBOutlet weak var txtMessage: DesignableTextField!
    @IBOutlet weak var btnSend: DesignableButton!
    
    var allmessages = [MessageDataModel]()
    var recieverUser : UserDataModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldValidation()
        self.title = recieverUser?.name
        getAllMessages()
    }
    
    func getAllMessages(){
        MessageDataManager.getAllMessages(thread: getThreadName()) { (messages) in
            self.allmessages = messages
            self.messageTableView.reloadData()
            if self.allmessages.count != 0{
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+0.1, execute: {
                    let indexPath = IndexPath(row: self.allmessages.count-1, section: 0)
                    self.messageTableView.scrollToRow(at: indexPath, at: UITableView.ScrollPosition.bottom, animated: true)
                })
            }
        }
    }

    func getThreadName() -> String{
        var thread = ""
        if recieverUser!.userId < UserDefaultManager.userId{
            thread = recieverUser!.userId + UserDefaultManager.userId
        }
        else{
            thread = UserDefaultManager.userId + recieverUser!.userId
        }
        return thread
    }
    
    @IBAction func onClickBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onClickSend(_ sender: Any) {
        let messageData = MessageDataModel(msg: txtMessage.text!, rvrId: recieverUser!.userId, sndrId: UserDefaultManager.userId)
        MessageDataManager.setMessage(thread: getThreadName(), messageData: messageData)
        txtMessage.text = ""
    }
}

extension ChattingViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allmessages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MessageCell", for: indexPath) as! MessageCell
        if allmessages[indexPath.row].senderId == UserDefaultManager.userId{
            cell.setMessageType(type: .outgoing)
        }
        else{
            cell.setMessageType(type: .incoming)
        }
        cell.txtMessage.text = allmessages[indexPath.row].message
        return cell
    }
}

extension ChattingViewController{
    func textFieldValidation(){
        btnSend.isEnabled = false
        txtMessage.addTarget(self, action: #selector(textDidChange(_sender:)), for: .editingChanged)
    }
    
    @objc func textDidChange(_sender:UITextField){
        if txtMessage.text?.count == 0 && txtMessage.text == ""{
            btnSend.alpha = 0.5
            btnSend.isEnabled = false
        }
        else{
            btnSend.alpha = 1
            btnSend.isEnabled = true
        }
    }
}
