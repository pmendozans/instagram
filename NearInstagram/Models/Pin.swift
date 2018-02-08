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
    var note: String = ""
    var imageUrl: URL?
    var media: String = ""
    var createdAt: Date?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        note <- map["note"]
        imageUrl <- (map["image.original.url"], URLTransform())
        media <- map["media.type"]
        createdAt <- (map[""], DateTransform())
    }
}
