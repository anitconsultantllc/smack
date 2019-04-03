//
//  RoundedButton.swift
//  smack
//
//  Created by Whaylon Coleman on 4/1/19.
//  Copyright © 2019 AnITConsultant, LLC. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedButton : UIButton{
    
    @IBInspectable var cornerRadius: CGFloat = 3.0{
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    override func awakeFromNib() {
        self.setupView()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.setupView()
    }
    
    func setupView(){
        self.layer.cornerRadius = cornerRadius
    }
    
}
