//
//  InsertRoomParam.swift
//  Bizkasa
//
//  Created by Tien Dinh on 7/27/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//

import Foundation
import ObjectMapper

class InsertRoomParam: Mappable {

    var FloorId: Int?
    var RoomClassId: Int?
    var RoomName: String?

    required init?(map: Map) {

    }

    init() {

    }

    func mapping(map: Map) {
        self.FloorId <- map["FloorId"]
        self.RoomClassId <- map["RoomClassId"]
        self.RoomName <- map["RoomName"]
    }
}
