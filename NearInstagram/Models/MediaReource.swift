//
//  MediaImages.swift
//  NearInstagram
//
//  Created by Pablo Ruiz on 2/2/18.
//  Copyright © 2018 nearsoft. All rights reserved.
//

import Foundation
import ObjectMapper

struct MediaReource: Mappable {
    var lowResolution: URL?
    var thumbnail: URL?
    var standardResolution: URL?
    
    init?(map: Map) {
    
    }
    
    mutating func mapping(map: Map) {
        lowResolution       <- (map["low_resolution.url"], URLTransform())
        thumbnail           <- (map["thumbnail.url"], URLTransform())
        standardResolution  <- (map["standard_resolution.url"], URLTransform())
    }
}
