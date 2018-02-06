//
//  MediaImage.swift
//  NearInstagram
//
//  Created by Pablo Ruiz on 2/2/18.
//  Copyright © 2018 nearsoft. All rights reserved.
//

import Foundation
import ObjectMapper

struct Media: Mappable {
    var id: Int = 0
    var location: String = ""
    var filter: String = ""
    var tags: [String] = []
    var commentCount: Int = 0
    var likeCount: Int = 0
    var imageUrls: MediaReource?
    var videoUrls: MediaReource?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        id <- map[""]
        location <- map["location"]
        filter <- map["filter"]
        tags <- map["tags"]
        commentCount <- map["comments"]["count"]
        likeCount <- map["likes"]["count"]
        imageUrls <- map["images"]
        videoUrls <- map["videos"]
    }
}
