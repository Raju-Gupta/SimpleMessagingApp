//
//  UserDataManager.swift
//  SimpleMessagingApp
//
//  Created by Raju Gupta on 30/05/20.
//  Copyright © 2020 Raju Gupta. All rights reserved.
//

import UIKit
import FirebaseDatabase

class UserDataManager{
    
    static let databaseRef = Database.database().reference()
    
    static func setUserData(userData : UserDataModel, userId : String){
        let ref = databaseRef.child("User").child(userId)
        ref.setValue(userData.toDictionary())
    }
}
