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
    
    //Variables
    var avatarName = "profileDefault"
    var avatarColor = "[0.5, 0.5, 0.5, 1]"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func createAccountPressed(_ sender: Any) {
        guard let name = usernameTxt.text, usernameTxt.text != "" else{return}
        guard let email = emailTxt.text, emailTxt.text != "" else{return}
        guard let pass = passwordTxt.text, passwordTxt.text != "" else{return}
        
        AuthService.instance.registerUser(email: email, password: pass) { (success) in
            if(success){
                AuthService.instance.loginUser(email: email, password: pass, completion: { (success) in
                    if success{
                        UserDataService.instance.createUser(name: name, email: email, avatarName: self.avatarName, avatarColor: self.avatarColor, completion: { (success) in
                            if success{
                                print(UserDataService.instance.name, UserDataService.instance.avatarName)
                                self.performSegue(withIdentifier: UNWIND, sender: nil)
                            }
                        })
                    }
                })            }
        }
    }
    
    @IBAction func pickAvatarPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_AVATAR_PICKER, sender: nil)
    }
    
    @IBAction func pickBgColorPressed(_ sender: Any) {
    }
    
    @IBAction func closedPressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
}
