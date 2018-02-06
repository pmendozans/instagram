//
//  UserCounts.swift
//  NearInstagram
//
//  Created by Pablo Ruiz on 2/2/18.
//  Copyright © 2018 nearsoft. All rights reserved.
//

import Foundation
import ObjectMapper

struct UserCounts: Mappable {
    
    var media: Int = 0
    var follows: Int = 0
    var followedBy: Int = 0
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        media       <- map["media"]
        follows     <- map["follows"]
        followedBy  <- map["followed_by"]
    }
}
