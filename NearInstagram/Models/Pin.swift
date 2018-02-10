//
//  Pin.swift
//  NearInstagram
//
//  Created by Pablo Ruiz on 2/7/18.
//  Copyright © 2018 nearsoft. All rights reserved.
//

import Foundation
import ObjectMapper

struct Pin: Mappable {
    var note = ""
    var media = ""
    var id = ""
    var imageUrl: URL?
    var createdAt: Date?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        note        <- map["note"]
        media       <- map["media.type"]
        id          <- map["id"]
        imageUrl    <- (map["image.original.url"], URLTransform())
        createdAt   <- (map["created_at"], DateTransform())
    }
}
