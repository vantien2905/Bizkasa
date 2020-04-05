//
//  CheckInParam.swift
//  Bizkasa
//
//  Created by DINH VAN TIEN on 4/5/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//

import Foundation
import ObjectMapper

class CheckInParam: Mappable {

    var Customers: [CustomerEntity] = []
    var Services: [WidgetEntity] = []
    var Id: Int?
    var RoomId: Int?
    var RoomClassName: String?
    var RoomName: String?
    var CaculatorMode: Int?
    var Price: Int?
    var OrderStatus: Int?
    var CustomerName: String?
    var Notes: String?

    required init?(map: Map) {

    }

    init() {

    }

    func mapping(map: Map) {
        self.Customers <- map["Customers"]
        self.Services <- map["Services"]
        self.Id <- map["Id"]
        self.RoomId <- map["RoomId"]
        self.RoomClassName <- map["RoomClassName"]
        self.RoomName <- map["RoomName"]
        self.CaculatorMode <- map["CaculatorMode"]
        self.Price <- map["Price"]
        self.OrderStatus <- map["OrderStatus"]
        self.CustomerName <- map["CustomerName"]
        self.Notes <- map["Notes"]
    }


}
