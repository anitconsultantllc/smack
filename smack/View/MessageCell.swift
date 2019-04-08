//
//  MessageCell.swift
//  smack
//
//  Created by Whaylon Coleman on 4/8/19.
//  Copyright © 2019 AnITConsultant, LLC. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {

    //IBOutlets
    @IBOutlet weak var userImage: CircleImage!
    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var timeStampLbl: UILabel!
    @IBOutlet weak var messageBodyLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(message: Message){
        messageBodyLbl.text = message.message ?? ""
        userNameLbl.text = message.userName ?? ""
        userImage.image = message.userAvatar == nil ?  UIImage(named: "profileDefault") : UIImage(named: message.userAvatar)
        userImage.backgroundColor = message.userAvatar == nil ? UIColor.lightGray :   UserDataService.instance.returnUIColor(components: message.userAvatar)
    }

}
