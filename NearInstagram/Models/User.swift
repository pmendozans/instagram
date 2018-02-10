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
    
    var id = 0
    var username = ""
    var firstName = ""
    var lastName = ""
    var bio = ""
    var pins = 0
    var followers = 0
    var following = 0
    var boards = 0
    var createdAt: Date?
    var profilePictureUrl: URL?

    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        id                  <- map["id"]
        username            <- map["username"]
        firstName           <- map["first_name"]
        lastName            <- map["last_name"]
        bio                 <- map["bio"]
        pins                <- map["counts.pins"]
        followers           <- map["counts.following"]
        following           <- map["counts.followers"]
        boards              <- map["counts.boards"]
        createdAt           <- (map["created_at"], DateTransform())
        profilePictureUrl   <- (map["image.60x60.url"], URLTransform())
    }
}
