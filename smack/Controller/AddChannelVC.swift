//
//  AddChannelVC.swift
//  smack
//
//  Created by Whaylon Coleman on 4/7/19.
//  Copyright © 2019 AnITConsultant, LLC. All rights reserved.
//

import UIKit

class AddChannelVC: UIViewController {
    //IBOutlets
    @IBOutlet weak var nameTxt: UITextField!
    @IBOutlet weak var chanDesc: UITextField!
    @IBOutlet weak var bgView: UIView!
    
    //IBActions
    @IBAction func createChannelPressed(_ sender: Any) {
        
        guard let channelName = nameTxt.text, nameTxt.text != "" else {return}
        guard let channelDescription = chanDesc.text, chanDesc.text != "" else {return}
        SocketService.instance.addChannel(channelName: channelName, channelDescription: channelDescription) { (success) in
            if success{
                self.dismiss(animated: true, completion: nil)
            }else{
                
            }
        }
    }
    
    @IBAction func closeModalPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    func setupView(){
        let closeTouch = UITapGestureRecognizer(target: self, action: #selector(AddChannelVC.closeTap(_:)))
        bgView.addGestureRecognizer(closeTouch)
        
        nameTxt.attributedPlaceholder = NSAttributedString(string: "name", attributes: [NSAttributedString.Key.foregroundColor : smackPurpleColorPlaceHolders])
        chanDesc.attributedPlaceholder = NSAttributedString(string: "description", attributes: [NSAttributedString.Key.foregroundColor : smackPurpleColorPlaceHolders])
    }
    
    @objc func closeTap(_ recognizer: UITapGestureRecognizer){
        dismiss(animated: true, completion: nil)
    }
    
}
