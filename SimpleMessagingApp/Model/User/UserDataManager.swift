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
    
    static func getUserData(userId : String, completion: @escaping(UserDataModel)->Void){
        databaseRef.child("User").child(userId).observeSingleEvent(of: .value) { (dataSnapShot) in
            if let snapShot = dataSnapShot.value as? NSDictionary{
                let name = snapShot["name"] as? String
                let avatar = snapShot["avatar"] as? String
                let email = snapShot["email"] as? String
                let userId = snapShot["userId"] as? String
                
                let userData = UserDataModel(Uname: name!, Uemail: email!, Uavatar: avatar!, UuserId: userId!)
                completion(userData)
            }
        }
    }
    
    static func getAllUsers(completion:@escaping([UserDataModel])->Void){
        var allUserData = [UserDataModel]()
        allUserData.removeAll()
        databaseRef.child("User").observeSingleEvent(of: .value) { (dataSnapShot) in
            for snap in dataSnapShot.children{
                let userSnap = snap as! DataSnapshot
                //let uid = userSnap.key
                let userDict = userSnap.value as! [String:String]
                let name = userDict["name"]
                let email = userDict["email"]
                let avatar = userDict["avatar"]
                let userId = userDict["userId"]
                
                if UserDefaultManager.userId != userId{
                    allUserData.append(UserDataModel(Uname: name!, Uemail: email!, Uavatar: avatar!, UuserId: userId!))
                }
            }
            completion(allUserData)
        }
        
    }
}
