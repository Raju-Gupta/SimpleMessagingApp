//
//  DataConvertion.swift
//  CookingApp
//
//  Created by Raju Gupta on 13/05/20.
//  Copyright © 2020 Raju Gupta. All rights reserved.
//

import UIKit

class DataConvertion{
    
    static func convertImageToBase64String (img: UIImage) -> String {
        return img.jpegData(compressionQuality: 1)?.base64EncodedString() ?? ""
    }
    
    static func convertBase64StringToImage (imageBase64String:String) -> UIImage {
        let imageData = Data.init(base64Encoded: imageBase64String, options: .init(rawValue: 0))
        let image = UIImage(data: imageData!)
        return image!
    }
}


