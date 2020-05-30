//
//  RegExManager.swift
//  CookingApp
//
//  Created by Raju Gupta on 30/04/20.
//  Copyright © 2020 Raju Gupta. All rights reserved.
//

import UIKit

class RegExManager{
    
    static var nameRegex : String{
        return "^(([^ ]?)(^[a-zA-Z].*[a-zA-Z]$)([^ ]?))$"
    }
    
    static var emailRegex : String{
        return "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    }
    
    static var phoneRegex : String{
        return "^[0-9]{10}$"
    }
    
    static var passwordRegex : String{
        return "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{6,}$"
    }
}
