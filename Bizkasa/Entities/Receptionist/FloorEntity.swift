//
//  FloorEntity.swift
//  Bizkasa
//
//  Created by Tien Dinh on 7/19/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//

import Foundation
import ObjectMapper

class FloorEntity: Mappable {

    var Id: Int?
    var Name: String?
    var NumRooms: Int?
    var RoomClassId: Int?
    var Rooms: [RoomEntity] = []

    required init?(map: Map) {

    }

    func mapping(map: Map) {
        self.Id <- map["Id"]
        self.Name <- map["Name"]
        self.NumRooms <- map["NumRooms"]
        self.RoomClassId <- map["RoomClassId"]
        self.Rooms <- map["Rooms"]

    }

}
