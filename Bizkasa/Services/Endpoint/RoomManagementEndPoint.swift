//
//  RoomManagementEndPoint.swift
//  Bizkasa
//
//  Created by Tien Dinh on 7/19/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//

import Foundation
import Alamofire

enum RoomManagementEndPoint {
    case getFloorWithRoom(token: String)
}

extension RoomManagementEndPoint: EndPointType {
    var path: String {
        switch self {
        case .getFloorWithRoom:
            return "api/Floor/GetFloorWithRoom"
        
        }
    }

    var httpMethod: HTTPMethod {
        switch self {
        case .getFloorWithRoom:
            return .post
        default:
            return .post
        }
    }

    var parameters: JSONDictionary {
        switch self {
        case .getFloorWithRoom(let token):
            return ["Token": token]
        }
    }

    var headers: HTTPHeaders? {
        return DefaultHeader().addAuthHeader()
    }
}
