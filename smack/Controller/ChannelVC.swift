//
//  ChannelVC.swift
//  smack
//
//  Created by Whaylon Coleman on 3/23/19.
//  Copyright © 2019 AnITConsultant, LLC. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.revealViewController()?.rearViewRevealWidth = self.view.frame.size.width - 60
    }
    
    

}
