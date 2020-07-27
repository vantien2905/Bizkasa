//
//  InsertOrUpdateFloorParam.swift
//  Bizkasa
//
//  Created by Tien Dinh on 7/27/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//

import Foundation
import ObjectMapper

class InsertOrUpdateFloorParam: Mappable {

    var Id: Int?
    var Name: String?
    var NumRooms: Int?
    var RoomClassId: Int?

    required init?(map: Map) {

    }

    init() {

    }

    func mapping(map: Map) {
        self.Id <- map["Id"]
        self.Name <- map["Name"]
        self.NumRooms <- map["NumRooms"]
        self.RoomClassId <- map["RoomClassId"]

    }
}
