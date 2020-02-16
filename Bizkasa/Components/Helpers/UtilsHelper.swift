//
//  UtilsHelper.swift
//  Vebrary
//
//  Created by DINH VAN TIEN on 5/14/19.
//  Copyright © 2019 DINH VAN TIEN. All rights reserved.
//

import UIKit
import Alamofire

class UtilsHelper {

    static func isConnectedToInternet() -> Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }

    static func isIpad() -> Bool {
        if UIDevice().userInterfaceIdiom == .pad {
            return true
        } else {
            return false
        }
    }
}
