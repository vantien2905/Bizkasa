//
//  RateSettingEndPoint.swift
//  Bizkasa
//
//  Created by Tien Dinh on 9/20/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//

import Foundation
import Alamofire

enum RateSettingEndPoint {
    case getRoomClass
}

extension RateSettingEndPoint: EndPointType {
    var path: String {
        switch self {
        case .getRoomClass:
            return "Room/GetRoomClass"
        
        }
    }

    var httpMethod: HTTPMethod {
        switch self {
        case .getRoomClass:
            return .get
        default:
            return .post
        }
    }

    var parameters: JSONDictionary {
        switch self {
        case .getRoomClass:
            return [:]
        }
    }

    var headers: HTTPHeaders? {
        return DefaultHeader().addAuthHeader()
    }
}
