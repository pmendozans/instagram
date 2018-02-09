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
    var firstName: String = ""
    var lastName: String = ""
    var createdAt: Date?
    var bio: String = ""
    var profilePictureUrl: URL?
    var pins: Int = 0
    var followers: Int = 0
    var following: Int = 0
    var boards: Int = 0

    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        id                  <- map["id"]
        username            <- map["username"]
        firstName           <- map["first_name"]
        lastName            <- map["last_name"]
        createdAt           <- (map["created_at"], DateTransform())
        bio                 <- map["bio"]
        profilePictureUrl   <- (map["image.60x60.url"], URLTransform())
        pins                <- map["counts.pins"]
        followers           <- map["counts.following"]
        following           <- map["counts.followers"]
        boards              <- map["counts.boards"]
    }
}
