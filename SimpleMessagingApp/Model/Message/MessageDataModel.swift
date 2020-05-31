//
//  MessageDataModel.swift
//  SimpleMessagingApp
//
//  Created by Raju Gupta on 31/05/20.
//  Copyright © 2020 Raju Gupta. All rights reserved.
//

import UIKit

class MessageDataModel{
    
    let message : String
    let recieverId : String
    let senderId : String
    
    init(msg : String, rvrId : String, sndrId : String) {
        self.message = msg
        self.recieverId = rvrId
        self.senderId = sndrId
    }
    
    func toDictionary() -> Any{
        return ["message":message, "recieverId": recieverId, "senderId": senderId] as Any
    }
}
