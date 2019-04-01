//
//  CreateAccountVC.swift
//  smack
//
//  Created by Whaylon Coleman on 4/1/19.
//  Copyright © 2019 AnITConsultant, LLC. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func closedPressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
}
