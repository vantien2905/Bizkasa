//
//  RateSettingEntity.swift
//  Bizkasa
//
//  Created by Tien Dinh on 9/20/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//

import Foundation
import ObjectMapper

class RateSettingEntity: Mappable {

    var RoomClass: RoomTypeEntity?
    var ConfigPrices: [PriceEntity] = []
    var RoomTypeFeatureIds: String?
    var Images: String?

    required init?(map: Map) {

    }

    func mapping(map: Map) {
        self.RoomClass <- map["RoomClass"]
        self.ConfigPrices <- map["ConfigPrices"]
        self.RoomTypeFeatureIds <- map["RoomTypeFeatureIds"]
        self.Images <- map["Images"]
    }
}

class PriceEntity: Mappable {

    var ConfigPriceRow: ConfigPriceEntity?
    var ConfigType: Int?
    var IsDefault: Bool?

    required init?(map: Map) {

    }

    func mapping(map: Map) {
        self.ConfigPriceRow <- map["ConfigPriceRow"]
        self.ConfigType <- map["ConfigType"]
        self.IsDefault <- map["IsDefault"]
    }
}
