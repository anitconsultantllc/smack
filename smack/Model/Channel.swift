//
//  Channel.swift
//  smack
//
//  Created by Whaylon Coleman on 4/7/19.
//  Copyright © 2019 AnITConsultant, LLC. All rights reserved.
//

import Foundation

//SWIFT 4 WAY OF PARSING JSON
//struct Channel : Decodable {
//    public private(set) var _id: String!
//    public private(set) var name: String!
//    public private(set) var description: String!
//    public private(set) var __v: Int?
//}

struct Channel  {
    public private(set) var id: String!
    public private(set) var channelTitle: String!
    public private(set) var channelDescription: String!
}
