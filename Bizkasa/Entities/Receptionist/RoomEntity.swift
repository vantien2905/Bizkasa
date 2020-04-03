//
//  RoomEntity.swift
//  Bizkasa
//
//  Created by DINH VAN TIEN on 3/15/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//

import Foundation
import ObjectMapper

class RoomTypeEntity: Mappable {

    var Id: Int?
    var Name: String?
    var HotelId: Int?
    var Rooms: [RoomEntity] = []


    required init?(map: Map) {

    }

    func mapping(map: Map) {
        self.Id <- map["Id"]
        self.Name <- map["Name"]
        self.HotelId <- map["HotelId"]
        self.Rooms <- map["Rooms"]
    }

}

class RoomEntity: Mappable {

    var Id: Int?
    var Name: String?
    var FloorId: Int?
    var RoomStatus: Int?
    var ColorStatus: String?
    var RoomClassId: Int?
    var RoomClassName: String?
    var HotelId: Int?
    var OrderRoom: OrderRoomEntity?


    required init?(map: Map) {

    }

    func mapping(map: Map) {
        self.Id <- map["Id"]
        self.Name <- map["Name"]
        self.FloorId <- map["FloorId"]
        self.RoomStatus <- map["RoomStatus"]
        self.ColorStatus <- map["ColorStatus"]
        self.RoomClassId <- map["RoomClassId"]
        self.RoomClassName <- map["RoomClassName"]
        self.HotelId <- map["HotelId"]
        self.OrderRoom <- map["OrderRoom"]
    }
}

class OrderRoomEntity: Mappable {

    var OrderId: Int?
    var CustomerNum: Int?
    var RoomPrice: Int?
    var CustomerName: String?
    var CustomerId: String?
    var CompanyName: String?
    var TimeSpend: String?
    var CheckInTime: String?
    var CheckInDate: String?
    var CheckOutTime: String?
    var CheckOutDate: String?
    var TimeToCheckOut: String?
    var CaculatorMode: Int?
    var CaculatorModeView: String?
    var OrderStatus: Int?


    required init?(map: Map) {

    }

    func mapping(map: Map) {

        self.OrderId <- map["OrderId"]
        self.CustomerNum <- map["CustomerNum"]
        self.RoomPrice <- map["RoomPrice"]
        self.CustomerName <- map["CustomerName"]
        self.CustomerId <- map["CustomerId"]
        self.CompanyName <- map["CompanyName"]
        self.TimeSpend <- map["TimeSpend"]
        self.CheckInTime <- map["CheckInTime"]
        self.CheckInDate <- map["CheckInDate"]
        self.CheckOutTime <- map["CheckOutTime"]
        self.CheckOutDate <- map["CheckOutDate"]
        self.TimeToCheckOut <- map["TimeToCheckOut"]
        self.CaculatorMode <- map["CaculatorMode"]
        self.CaculatorModeView <- map["CaculatorModeView"]
        self.OrderStatus <- map["OrderStatus"]

    }

}
