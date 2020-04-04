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
    var TotalAmount:  Int?
    var Price:  Int?
    var PriceByDay:  Int?
    var PriceOverNight:  Int?
    var PriceByHour:  Int?
    var SurchargeAmount:  Int?
    var DeductibleAmount:  Int?
    var PrepaidAmount:  Int?
    var MiniBarAmount:  Int?
    var Cashed:  Int?
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
    var TimeUseds: [TimeUsed] = []
    var OrderAttachments: [OrderAttachment] = []

    var RoomAmount: Int?
    var SubAmount: Int?
    var Customers: [CustomerEntity] = []
    var AttachmentAmount: Int?

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
        self.TimeUseds <- map["TimeUseds"]
        self.RoomAmount <- map["RoomAmount"]
        self.SubAmount <- map["SubAmount"]
        self.Customers <- map["Customers"]
        self.OrderAttachments <- map["OrderAttachments"]
        self.AttachmentAmount <- map["AttachmentAmount"]
    }
}

class SubFeeDetailEntity: Mappable {

    var Id: Int?
    var OrderId: Int?
    var DetailTypeId: Int?
    var Quantity: Int?
    var Price: Int?
    var SubAmount: Int?
    var Title: String?
    var Note: String?
    var ShiftId: Int?
    var RelatedId: Int?
    var CreatedDate: String?
    var UpdatedDate: String?

    required init?(map: Map) {

    }

    init() {
        
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

class TimeUsed: Mappable {

    var UnitUsed: Int?
    var Description: String?
    var SumAmount: Int?

    required init?(map: Map) {

    }

     func mapping(map: Map) {

        self.UnitUsed <- map["UnitUsed"]
        self.Description <- map["Description"]
        self.SumAmount <- map["SumAmount"]

    }
}

class OrderAttachment: Mappable {

    var OrderId: Int?
    var RoomId: Int?
    var RoomName: String?
    var Note: String?
    var TotalAmount: Int?

    required init?(map: Map) {

    }

     func mapping(map: Map) {

        self.OrderId <- map["OrderId"]
        self.RoomId <- map["RoomId"]
        self.RoomName <- map["RoomName"]
        self.Note <- map["Note"]
        self.TotalAmount <- map["TotalAmount"]
    }
}
