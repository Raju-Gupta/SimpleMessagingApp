//
//  UserDefaultManager.swift
//  CookingApp
//
//  Created by Raju Gupta on 07/05/20.
//  Copyright © 2020 Raju Gupta. All rights reserved.
//

import UIKit

class UserDefaultManager{
    
    static let userDefault = UserDefaults.standard
    
    //UserId (Firebase User Uid)
    static var userId : String{
        get{
            return userDefault.string(forKey: "uid")!
        }
        set{
            userDefault.set(newValue, forKey: "uid")
        }
    }
    //User Login Status
    static var isLogin : Bool{
        get{
            return userDefault.bool(forKey: "isLogin")
        }
        set{
            userDefault.set(newValue, forKey: "isLogin")
        }
    }
    //User Email Address
    static var userEmail : String{
        get{
            return userDefault.string(forKey: "email")!
        }
        set{
            userDefault.set(newValue, forKey: "email")
        }
    }
    
    // MARK: - UserDefault Data Storing
    static func userDefaultDataSet(isLogin:Bool, uid: String, email: String){
        userDefault.set(isLogin, forKey: "isLogin")
        userDefault.set(uid, forKey: "uid")
        userDefault.set(email, forKey: "email")
    }
    
    //Removing All UserDefault Values
    static func removeAll(){
        userDefault.removeObject(forKey: "uid")
        userDefault.removeObject(forKey: "email")
        userDefault.set(false, forKey: "isLogin")
        userDefault.synchronize()
    }
}
