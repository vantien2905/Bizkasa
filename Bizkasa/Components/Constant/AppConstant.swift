//
//  AppConstant.swift
//  Vebrary
//
//  Created by DINH VAN TIEN on 7/26/19.
//  Copyright © 2019 DINH VAN TIEN. All rights reserved.
//

import UIKit

struct AppConstant {
    static let firstPath = "/api/"
    static let BASE_URL = "http://media.bizkasa.com" //"http://test.api.bizkasa.com"
}

struct DateFormat {
    //-----Format date time
    static let COMMON_DATETIME_ZTIME    = "yyyy-MM-dd'T'HH:mm:ssZ"
    static let SIMPLE_FULL_DATETIME     = "HH:mm dd 'th'MM, yyyy"
    static let DEFAULT                  = "yyyy-MM-dd'T'HH:mm:ss"
    static let DEFAULTZ                 = "yyyy-MM-dd'T'HH:mm:ss.SSS"
    static let SIMPLE_DATETIME          = "dd 'th'MM yyyy"
    static let SIMPLE_DATE             = "dd/MM/yyyy"
    static let FULL_DATETIME_FORMAT     = "dd/MM/yyyy HH:mm"
    static let SIMPLE_TIME              = "HH:mm"
    static let SIMPLE_LONG_TIME         = "HH:mm:ss"
    static let SIMPLE_DATE_DASH         = "yyyy-MM-dd"
}
