//
//  DeviceEntity.swift
//  DXG E-Office
//
//  Created by DINH VAN TIEN on 1/10/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//

import Foundation
import ObjectMapper

class DeviceParam: Mappable {

    var token      : String?
    var name       : String?
    var imei       : String?
    var osName     : String?
    var osVersion  : String?

    required init?(map: Map) {

    }

    func mapping(map: Map) {
        self.token          <- map["token"]
        self.name           <- map["name"]
        self.imei           <- map["imei"]
        self.osName         <- map["osName"]
        self.osVersion      <- map["osVersion"]
    }
}
