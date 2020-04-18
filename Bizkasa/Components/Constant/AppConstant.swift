//
//  AppConstant.swift
//  Vebrary
//
//  Created by DINH VAN TIEN on 7/26/19.
//  Copyright © 2019 DINH VAN TIEN. All rights reserved.
//

import UIKit

struct AppConstant {
    static let MASTER_WIDTH: CGFloat    = UIScreen.main.bounds.width*2/5
    static let padingIpad: CGFloat      = 80.0
    static let padingIphone: CGFloat    = 10.0
    static let NOTIFICATION_UPDATE_APP  = "NOTIFICATION_UPDATE_APP"
    static let defaultParentID          = "00000000-0000-0000-0000-000000000000"
    static let TAG_TASK_VIEW_TYPE       = "TAG_TASK_VIEW_TYPE"
    static let TAG_SAVE_USER_NAME_FOR_DMS       = "TAG_SAVE_USER_NAME_FOR_DMS"
    static let moduleDMSOrder          = -2

    static let URL_DOWNLOAD             = "/mobileapis/api/task/DownloadFileDocument?fileDocumentID="


    static let logoLink = "/mobileapis/images/logo.png"
    static let more_tag = 99999

    static let BASE_URL = "http://test.api.bizkasa.com"

//    static let calculatorModeAll: [Calculator] = [CaculatorMode.day.value,
//                                              CaculatorMode.overNight.value,
//                                              CaculatorMode.hour.value,
//                                              CaculatorMode.month.value]

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
