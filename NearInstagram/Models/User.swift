//
//  User.swift
//  NearInstagram
//
//  Created by Pablo Ruiz on 2/2/18.
//  Copyright © 2018 nearsoft. All rights reserved.
//

import Foundation
import ObjectMapper

struct User: Mappable {
    
    var id: Int = 0
    var username: String = ""
    var fullName: String = ""
    var profilePictureUrl: URL?
    var bio: String = ""
    var website: URL?
    var isBusiness: Bool?

    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        id                  <- map["id"]
        username            <- map["username"]
        fullName            <- map["full_name"]
        profilePictureUrl   <- map["profile_picture"]
        bio                 <- map["bio"]
        website             <- map["website"]
        isBusiness          <- map["isBusiness"]
    }
}
