//
//  CreateAccountVC.swift
//  smack
//
//  Created by Whaylon Coleman on 4/1/19.
//  Copyright © 2019 AnITConsultant, LLC. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    
    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var userImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func createAccountPressed(_ sender: Any) {
        guard let email = emailTxt.text, emailTxt.text != "" else{return}
        guard let pass = passwordTxt.text, passwordTxt.text != "" else{return}
        
        AuthService.instance.registerUser(email: email, password: pass) { (success) in
            if(success){
                AuthService.instance.loginUser(email: email, password: pass, completion: { (success) in
                    if success{
                        print("logged in user!", AuthService.instance.authToken)
                    }
                })            }
        }
    }
    
    @IBAction func pickAvatarPressed(_ sender: Any) {
    }
    
    @IBAction func pickBgColorPressed(_ sender: Any) {
    }
    
    @IBAction func closedPressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
}