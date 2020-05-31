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
        self.title = recieverUser?.name
        getAllMessages()
    }
    
    func getAllMessages(){
        Database.database().reference(withPath: "Messages").child(getThreadName()).observe(.value) { (dataSnapShot) in
            self.allmessages.removeAll()
            if let snapShot = dataSnapShot.children.allObjects as? [DataSnapshot]{
                for snap in snapShot{
                    let snapdata = snap.value as! NSDictionary
                    let message = snapdata["message"] as? String
                    let recieverId = snapdata["recieverId"] as? String
                    let senderId = snapdata["senderId"] as? String
                    self.allmessages.append(MessageDataModel(message: message!, recieverId: recieverId!, senderId: senderId!))
                    self.messageTableView.reloadData()
                }
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
        if txtMessage.text?.count != 0{
            let ref = Database.database().reference(withPath: "Messages").child(getThreadName()).childByAutoId()
            let messageData = ["message":txtMessage.text!, "recieverId":recieverUser!.userId, "senderId":UserDefaultManager.userId] as [String : String]
            ref.setValue(messageData)
            txtMessage.text = ""
        }
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
