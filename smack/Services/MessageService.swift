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
                if let json = try JSON(data: data).array{
                    for item in json{
                        let name = item["name"].stringValue
                        let channelDescription = item["description"].stringValue
                        let id = item["_id"].stringValue
                        let channel = Channel(id: id, channelTitle: name, channelDescription: channelDescription)
                        self.channels.append(channel)
                    }
                    print(self.channels[2].channelTitle)
                    completion(true)
                }
                }catch{}
                
            }else{
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
        
    }
    
}
