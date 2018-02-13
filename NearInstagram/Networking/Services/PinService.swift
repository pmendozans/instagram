//
//  PinService.swift
//  NearInstagram
//
//  Created by Pablo Ruiz on 2/12/18.
//  Copyright © 2018 nearsoft. All rights reserved.
//

import Foundation
import PromiseKit
import Alamofire

class PinService {
    
    let apiManager = ApiManager()
    
    func getImages(byBoard board: String) -> Promise<[String: Any]> {
        return apiManager.genericRequest(request: PinRouter.getPinsInBoard(boardName: board))
    }
    
    func getPinDetails(byPinId pinId: String) -> Promise<[String: Any]> {
        return apiManager.genericRequest(request: PinRouter.getPinDetails(pinId: pinId))
    }
}
