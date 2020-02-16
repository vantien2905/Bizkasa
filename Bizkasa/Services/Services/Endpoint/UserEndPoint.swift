//
//  PatronEndPoint.swift
//  Vebrary
//
//  Created by DINH VAN TIEN on 5/9/19.
//  Copyright © 2019 DINH VAN TIEN. All rights reserved.
//

import Alamofire

enum UserEndPoint {
    case getSecretKey
}

extension UserEndPoint: EndPointType {
    var path: String {
        switch self {
        case .getSecretKey:
            return "mobileapis/SurePortalServices.svc/GetEncryptKey"
        }
    }

    var httpMethod: HTTPMethod {
        switch self {
        default:
            return .post
        }
    }

    var parameters: JSONDictionary {
        switch self {
        case .getSecretKey:
            var secretKey = ""
            if let udidDevice: UUID = UIDevice.current.identifierForVendor {
                secretKey += udidDevice.uuidString
            } else {
                secretKey += "XXX-XXX"
            }
//            let dateTime = Date().toFormatDate(format: "yyyy_MM_dd_HH_mm")
//            secretKey += "_\(dateTime)"
            return ["secretKey":secretKey]
        }
    }

    var headers: HTTPHeaders? {
        return DefaultHeader().addAuthHeader()
    }
}
