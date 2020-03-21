//
//  ConfigurePriceEntity.swift
//  Bizkasa
//
//  Created by DINH VAN TIEN on 3/15/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//

import Foundation
import ObjectMapper

class ConfigPriceEntity: Mappable {

    var Id: Int?
    var Name: String?
    var PriceByDay: Float?
    var PriceByNight: Float?
    var PriceByMonth: Float?
    var RoomClassId: Int?
    var IsActive: Bool?
    var IsDefault: Bool?
    var CheckoutDayList: String?
    var CheckoutNightList: String?
    var CheckinDayList: String?
    var CheckinNightList: String?
    var PriceByDayList: String?
    var AddtionCustomerList: String?
    var ConfigTime: String?

    required init?(map: Map) {

    }

    func mapping(map: Map) {
        self.Id <- map["Id"]
        self.Name <- map["Name"]
        self.PriceByDay <- map["PriceByDay"]
        self.PriceByNight <- map["PriceByNight"]
        self.PriceByMonth <- map["PriceByMonth"]
        self.RoomClassId <- map["RoomClassId"]
        self.IsActive <- map["IsActive"]
        self.IsDefault <- map["IsDefault"]
        self.CheckoutDayList <- map["CheckoutDayList"]
        self.CheckoutNightList <- map["CheckoutNightList"]
        self.CheckinDayList <- map["CheckinDayList"]
        self.CheckinNightList <- map["CheckinNightList"]
        self.PriceByDayList <- map["PriceByDayList"]
        self.AddtionCustomerList <- map["AddtionCustomerList"]
        self.ConfigTime <- map["ConfigTime"]
    }

}
