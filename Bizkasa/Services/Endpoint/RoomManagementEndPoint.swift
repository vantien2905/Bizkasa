//
//  RoomManagementEndPoint.swift
//  Bizkasa
//
//  Created by Tien Dinh on 7/19/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

enum RoomManagementEndPoint {
    case getFloorWithRoom(token: String)
    case deleteFloor(id: Int)
    case insertOrUpdateFloor(param: InsertOrUpdateFloorParam)
    case editRoom(param: EditRoomParam)
    case deleteRoom(id: Int)
    case getListRoomClass
    case getListFloor
//    case insertRoom(param: [EditRoomParam])
    case getRoomForEdit(roomID: Int)
}

extension RoomManagementEndPoint: EndPointType {
    var path: String {
        switch self {
        case .getFloorWithRoom:
            return "Floor/GetFloorWithRoom"
        case .deleteFloor:
            return "Floor/DeleteFloor"
        case .insertOrUpdateFloor:
            return "Floor/InsertOrUpdateFloor"
        case .editRoom:
            return "Room/EditRoom"
        case .deleteRoom:
            return "Room/DeleteRoom"
        case .getListRoomClass:
            return "Room/GetListRoomClass"
        case .getListFloor:
            return "Floor/GetListFloor"
        case .getRoomForEdit:
            return "Room/GetRoomForEdit"
//        case .insertRoom:
//            return "Floor/InsertRoom"
        }
    }

    var httpMethod: HTTPMethod {
        switch self {
        case .getFloorWithRoom:
            return .post
        case .getListFloor, .getListRoomClass:
            return .get
        default:
            return .post
        }
    }

    var parameters: JSONDictionary {
        switch self {
        case .getFloorWithRoom(let token):
            return ["Token": token]
        case .deleteFloor(let id):
            return ["Ids": [id]]
        case .insertOrUpdateFloor(let param):
            return param.toJSON()
        case .editRoom(let param):
            return param.toJSON()
        case .deleteRoom(let id):
            return ["roomId": id]
        case .getListRoomClass:
            return [:]
        case .getListFloor:
            return [:]
//        case .insertRoom(let param):
//            return param.toJSON()
        case .getRoomForEdit(let roomID):
            return ["roomid": roomID]
        }
    }

    var headers: HTTPHeaders? {
        return DefaultHeader().addAuthHeader()
    }
}
