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
    var PriceByDay: Int?
    var PriceByNight: Int?
    var PriceByMonth: Int?
    var RoomClassId: Int?
    var IsActive: Bool?
    var IsDefault: Bool?
    var CheckoutDayList: [CheckoutEntity] = []
    var CheckoutNightList: [CheckoutEntity] = []
    var CheckinDayList: [CheckoutEntity] = []
    var CheckinNightList: [CheckoutEntity] = []
    var PriceByDayList: [CheckoutEntity] = []
    var AddtionCustomerList: [CheckoutEntity] = []
    var ConfigTime: String?
    
    init() {
    }

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

class CheckoutEntity: Mappable {

    var Id: Int?
    var ConfigPriceId: Int?
    var Key: Int?
    var Value: Int?
    var Additional: Int?
    
    init() {
    }

    required init?(map: Map) {

    }

    func mapping(map: Map) {
        self.Id <- map["Id"]
        self.ConfigPriceId <- map["ConfigPriceId"]
        self.Key <- map["Key"]
        self.Value <- map["Value"]
        self.Additional <- map["Additional"]
    }
}
