//
//  EditRoomParam.swift
//  Bizkasa
//
//  Created by Tien Dinh on 7/27/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//

import Foundation
import ObjectMapper

class EditRoomParam: Mappable {

    var FloorId         : Int?
    var RoomClassId     : Int?
    var RoomId          : Int?
    var RoomName        : String?

    required init?(map: Map) {

    }

    init() {

    }
    
    init(FloorId: Int,
         RoomClassId: Int,
         RoomName: String,
         roomID: Int) {
        self.FloorId        = FloorId
        self.RoomClassId    = RoomClassId
        self.RoomName       = RoomName
        self.RoomId         = roomID
    }

    func mapping(map: Map) {
        self.FloorId        <- map["FloorId"]
        self.RoomClassId    <- map["RoomClassId"]
        self.RoomId         <- map["RoomId"]
        self.RoomName       <- map["RoomName"]
    }
}
