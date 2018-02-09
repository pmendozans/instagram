//
//  ErrorAlerts.swift
//  NearInstagram
//
//  Created by Pablo Ruiz on 2/9/18.
//  Copyright © 2018 nearsoft. All rights reserved.
//

import Foundation
import LKAlertController

enum ErrorAlerts {
    static let serverError = Alert(message: NSLocalizedString("server-error", comment: "")).addAction("OK")
}
