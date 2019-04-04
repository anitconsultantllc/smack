//
//  AvatarViewCell.swift
//  smack
//
//  Created by Whaylon Coleman on 4/3/19.
//  Copyright © 2019 AnITConsultant, LLC. All rights reserved.
//

import UIKit

public enum AvatarType: Int {
    case dark = 0
    case light = 1
}

class AvatarCell: UICollectionViewCell {
    
    @IBOutlet weak var avatarImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setUpView()
    }
    
    func configureCell(index: Int, type: AvatarType){
        if type == AvatarType.dark{
            avatarImage.image = UIImage(named: "dark\(index)")
            self.layer.backgroundColor = UIColor.lightGray.cgColor
        }else{
            avatarImage.image = UIImage(named: "light\(index)")
            self.layer.backgroundColor = UIColor.gray.cgColor
            
        }
    }
    
    func setUpView(){
        self.layer.backgroundColor = UIColor.lightGray.cgColor
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
    }
}
