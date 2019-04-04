//
//  UserData.swift
//  smack
//
//  Created by Whaylon Coleman on 4/2/19.
//  Copyright © 2019 AnITConsultant, LLC. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class UserDataService{
    static let instance = UserDataService()
    
    public private(set) var id = ""
    public private(set) var avatarColor = ""
    public private(set) var avatarName = ""
    public private(set) var email = ""
    public private(set) var name = ""
    
    func setUserData(id: String, color: String, avatarName: String, email: String, name: String){
        self.id = id
        self.avatarColor = color
        self.avatarName = avatarName
        self.email = email
        self.name = name
    }
    
    func setAvatarName(avatarName: String){
        self.avatarName = avatarName
    }
    
    func createUser(name: String, email: String, avatarName: String, avatarColor: String, completion: @escaping CompletionHandler){
        let lowerCaseEmail = email.lowercased()
        let body: [String: Any] = [
        "name": name,
        "email": lowerCaseEmail,
        "avatarName": avatarName,
        "avatarColor": avatarColor
        ]
        let header = [
            "Authorization": "Bearer \(AuthService.instance.authToken)",
            "Content-Type": "application/json; charset=utf-8"
        ]
        
        Alamofire.request(URL_USER_ADD, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
            if response.result.error == nil {
                do{
                guard let data = response.data else {return}
                let json = try JSON(data: data)
                let id = json["_id"].stringValue
                let color = json["avatarColor"].stringValue
                let avatarName = json["avatarName"].stringValue
                let email = json["email"].stringValue
                let name = json["name"].stringValue
                
                UserDataService.instance.setUserData(id: id, color: color, avatarName: avatarName, email: email, name: name)
                }catch{
                    
                }
                completion(true)
                
            }else{
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
}
