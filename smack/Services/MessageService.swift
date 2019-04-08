//
//  MessageService.swift
//  smack
//
//  Created by Whaylon Coleman on 4/7/19.
//  Copyright © 2019 AnITConsultant, LLC. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class MessageService{
    static let instance = MessageService()
    
    var channels = [Channel()]
    var messages = [Message()]
    var selectedChannel : Channel?
    
    
    func findAllChannel(completion: @escaping CompletionHandler){
        Alamofire.request(URL_GET_CHANNELS, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: BEARER_HEADER).responseJSON { (response) in
            if response.result.error == nil{
                guard let data = response.data else {return}
                
                //NEW SWIFT 4 WAY OF PARSING JSON IN ONE LINE OF CODE
//                do{
//                    self.channels = try JSONDecoder().decode([Channel].self, from: data)
//                }catch let error{
//                    debugPrint(error as Any)
//                }
//                print(self.channels)
                
                do{
                    self.clearChannels()
                    if let json = try JSON(data: data).array{
                        for item in json{
                                let name = item["name"].stringValue
                                let channelDescription = item["description"].stringValue
                                let id = item["_id"].stringValue
                                let channel = Channel(id: id, channelTitle: name, channelDescription: channelDescription)
                                self.channels.append(channel)
                    }
                    NotificationCenter.default.post(name: NOTIF_CHANNELS_LOADED, object: nil)
                    completion(true)
                }
                }catch{
                    completion(false)
                    debugPrint(response.result.error as Any)
                }
                
            }else{
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    func clearChannels(){
        channels.removeAll()
    }
    
    func clearMessages(){
        messages.removeAll()
    }
    
    func findAllMessagesForChannel(channelId: String, completion: @escaping CompletionHandler){
        Alamofire.request("\(URL_GET_MESSAGES)\(channelId)", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: BEARER_HEADER).responseJSON { (response) in
            if response.result.error == nil{
                self.clearMessages()
                guard let data = response.data else{return}
                do{
                    if let json = try JSON(data: data).array{
                        for item in json{
                            let messageBody = item["messageBody"].stringValue
                            let channelId = item["channelId"].stringValue
                            let id = item["_id"].stringValue
                            let userName = item["userName"].stringValue
                            let userAvatar = item["userAvatar"].stringValue
                            let userAvatarColor = item["userAvatarColor"].stringValue
                            let timeStamp = item["timeStamp"].stringValue
                            
                            let message = Message(message: messageBody, userName: userName, channelId: channelId, userAvatar: userAvatar, userAvatarColor: userAvatarColor, id: id, timeStamp: timeStamp)
                            self.messages.append(message)
                        }
                        print(self.messages)
                        completion(true)
                    }
                }catch{
                    
                }
            }else{
                debugPrint(response.result.error as Any)
                completion(false)
            }
        }
    }
    
}
