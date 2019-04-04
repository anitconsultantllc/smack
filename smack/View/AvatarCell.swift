//
//  AvatarViewCell.swift
//  smack
//
//  Created by Whaylon Coleman on 4/3/19.
//  Copyright © 2019 AnITConsultant, LLC. All rights reserved.
//

import UIKit

class AvatarCell: UICollectionViewCell {
    
    @IBOutlet weak var avatarImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setUpView()
    }
    
    func setUpView(){
        self.layer.backgroundColor = UIColor.lightGray.cgColor
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
    }
}
