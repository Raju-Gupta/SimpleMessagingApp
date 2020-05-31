//
//  MessageDataManager.swift
//  SimpleMessagingApp
//
//  Created by Raju Gupta on 31/05/20.
//  Copyright © 2020 Raju Gupta. All rights reserved.
//

import UIKit
import FirebaseDatabase

class MessageDataManager{
    
    static let databaseRef = Database.database().reference()
    
    static func setMessage(thread : String, messageData : MessageDataModel){
       let ref = databaseRef.child("Messages").child(thread).childByAutoId()
        ref.setValue(messageData.toDictionary())
    }
    
    
    static func getAllMessages(thread:String, completion:@escaping([MessageDataModel])->Void){
        
        var allmessages = [MessageDataModel]()
        Database.database().reference(withPath: "Messages").child(thread).observe(.value) { (dataSnapShot) in
    
            if let snapShot = dataSnapShot.children.allObjects as? [DataSnapshot]{
                allmessages.removeAll()
                for snap in snapShot{
                    let snapdata = snap.value as! NSDictionary
                    let message = snapdata["message"] as? String
                    let recieverId = snapdata["recieverId"] as? String
                    let senderId = snapdata["senderId"] as? String
                    //print(message)
                    allmessages.append(MessageDataModel(
                        msg: message!,
                        rvrId: recieverId!,
                        sndrId: senderId!))
                }
                completion(allmessages)
            }
        }
    }
    
}
