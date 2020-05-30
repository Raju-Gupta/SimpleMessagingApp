//
//  UserDataModel.swift
//  SimpleMessagingApp
//
//  Created by Raju Gupta on 30/05/20.
//  Copyright © 2020 Raju Gupta. All rights reserved.
//

import UIKit

class UserDataModel{
    let name : String
    let email : String
    let avatar : String
    let userId : String
    
    init(Uname : String, Uemail : String, Uavatar : String, UuserId : String) {
        
        self.name = Uname
        self.email = Uemail
        self.avatar = Uavatar
        self.userId = UuserId
    }
    
    func toDictionary()-> Any{
        return ["name":name, "email":email, "avatar":avatar, "userId":userId] as Any
    }
}
