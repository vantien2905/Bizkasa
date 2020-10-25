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
    case addRoomClass(param: RateSettingEntity)
    case deleteRoomClass(listID: [Int])
}

extension RateSettingEndPoint: EndPointType {
    var path: String {
        switch self {
        case .getRoomClass:
            return "Room/GetRoomClass"
        case .addRoomClass:
            return "Room/AddRoomClass"
        case .deleteRoomClass:
            return "Room/DeleteRoomClass"
        
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
        case .addRoomClass(let param):
            return param.toJSON()
        case .deleteRoomClass(let listID):
            return ["Ids": listID]
        }
    }

    var headers: HTTPHeaders? {
        return DefaultHeader().addAuthHeader()
    }
}
