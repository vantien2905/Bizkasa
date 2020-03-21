//
//  OrderInfoEntity.swift
//  Bizkasa
//
//  Created by DINH VAN TIEN on 3/21/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//

import Foundation
import ObjectMapper

class OrderInfoEntity: Mappable {

    var Id:  Int?
    var HotelId:  Int?
    var ParentId:  Int?
    var GroupOrderId:  Int?
    var RoomId:  Int?
    var ShiftId:  Int?
    var ConfigPriceId:  Int?
    var PassportId:  Int?
    var CustomerId:  Int?
    var CustomerName:  String?
    var RoomClassName:  String?
    var RoomName:  String?
    var CompanyName:  String?
    var Card:  Int?
    var NumberVehicle:  Int?
    var Notes:  String?
    var TotalAmount:  Float?
    var Price:  Float?
    var PriceByDay:  Float?
    var PriceOverNight:  Float?
    var PriceByHour:  Float?
    var SurchargeAmount:  Float?
    var DeductibleAmount:  Float?
    var PrepaidAmount:  Float?
    var MiniBarAmount:  Float?
    var Cashed:  Float?
    var OrderStatus:  Int?
    var PaymentMethod:  Int?
    var CaculatorMode:  Int?
    var CheckInTime:  String?
    var CheckOutTime:  String?
    var CheckInDate:  String?
    var CheckInDateView:  String?
    var CheckInTimeText:  String?
    var CheckOutDateView:  String?
    var CurrentDateView:  String?
    var CheckOutTimeText:  String?
    var CheckOutDate:  String?
    var Services:  String?
    var MiniBars: [SubFeeDetailEntity] = []
    var Surcharges: [SubFeeDetailEntity] = []
    var Deductibles: [SubFeeDetailEntity] = []
    var Prepaids: [SubFeeDetailEntity] = []

    required init?(map: Map) {

    }

    func mapping(map: Map) {
        self.Id <- map["Id"]
        self.HotelId <- map["HotelId"]
        self.ParentId <- map["ParentId"]
        self.GroupOrderId <- map["GroupOrderId"]
        self.RoomId <- map["RoomId"]
        self.ShiftId <- map["ShiftId"]
        self.ConfigPriceId <- map["ConfigPriceId"]
        self.PassportId <- map["PassportId"]
        self.CustomerId <- map["CustomerId"]
        self.CustomerName <- map["CustomerName"]
        self.RoomClassName <- map["RoomClassName"]
        self.RoomName <- map["RoomName"]
        self.CompanyName <- map["CompanyName"]
        self.Card <- map["Card"]
        self.NumberVehicle <- map["NumberVehicle"]
        self.Notes <- map["Notes"]
        self.TotalAmount <- map["TotalAmount"]
        self.Price <- map["Price"]
        self.PriceByDay <- map["PriceByDay"]
        self.PriceOverNight <- map["PriceOverNight"]
        self.PriceByHour <- map["PriceByHour"]
        self.SurchargeAmount <- map["SurchargeAmount"]
        self.DeductibleAmount <- map["DeductibleAmount"]
        self.PrepaidAmount <- map["PrepaidAmount"]
        self.MiniBarAmount <- map["MiniBarAmount"]
        self.Cashed <- map["Cashed"]
        self.OrderStatus <- map["OrderStatus"]
        self.PaymentMethod <- map["PaymentMethod"]
        self.CaculatorMode <- map["CaculatorMode"]
        self.CheckInTime <- map["CheckInTime"]
        self.CheckOutTime <- map["CheckOutTime"]
        self.CheckInDate <- map["CheckInDate"]
        self.CheckInDateView <- map["CheckInDateView"]
        self.CheckInTimeText <- map["CheckInTimeText"]
        self.CheckOutDateView <- map["CheckOutDateView"]
        self.CurrentDateView <- map["CurrentDateView"]
        self.CheckOutTimeText <- map["CheckOutTimeText"]
        self.CheckOutDate <- map["CheckOutDate"]
        self.Services <- map["Services"]
        self.MiniBars <- map["MiniBars"]
        self.Surcharges <- map["Surcharges"]
        self.Deductibles <- map["Deductibles"]
        self.Prepaids <- map["Prepaids"]
    }

}

class SubFeeDetailEntity: Mappable {

    var Id: Int?
    var OrderId: Int?
    var DetailTypeId: Int?
    var Quantity: Int?
    var Price: Float?
    var SubAmount: Float?
    var Title: String?
    var Note: String?
    var ShiftId: Int?
    var RelatedId: Int?
    var CreatedDate: String?
    var UpdatedDate: String?

    required init?(map: Map) {

    }

    func mapping(map: Map) {
        self.Id <- map["Id"]
        self.OrderId <- map["OrderId"]
        self.DetailTypeId <- map["DetailTypeId"]
        self.Quantity <- map["Quantity"]
        self.Price <- map["Price"]
        self.SubAmount <- map["SubAmount"]
        self.Title <- map["Title"]
        self.Note <- map["Note"]
        self.ShiftId <- map["ShiftId"]
        self.RelatedId <- map["RelatedId"]
        self.CreatedDate <- map["CreatedDate"]
        self.UpdatedDate <- map["UpdatedDate"]
    }

}
