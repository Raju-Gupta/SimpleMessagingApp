//
//  UserCell.swift
//  SimpleMessagingApp
//
//  Created by Raju Gupta on 31/05/20.
//  Copyright © 2020 Raju Gupta. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {

    @IBOutlet weak var viewContainer: DesignableView!
    @IBOutlet weak var imgAvatar: DesignableImageView!
    @IBOutlet weak var lblName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
