//
//  InvoiceEntity.swift
//  Bizkasa
//
//  Created by DINH VAN TIEN on 3/15/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//

import Foundation
import ObjectMapper

class InvoiceResponse: Mappable {

    var dataPaging: InvoicePagingData?
    var totalAmount: Int?
    var deductibleAmount: Int?


    required init?(map: Map) {

    }

    func mapping(map: Map) {
        self.dataPaging <- map["DataPaging"]
        self.totalAmount <- map["Summary.TotalAmount"]
        self.deductibleAmount <- map["Summary.DeductibleAmount"]
    }

}

class InvoicePagingData: Mappable {

    var data: [InvoiceEntity] = []
    var totalRecord: Int?


    required init?(map: Map) {

    }

    func mapping(map: Map) {
        self.data <- map["Data"]
        self.totalRecord <- map["TotalRecord"]
    }

}

class InvoiceEntity: Mappable {

    var Id: Int?
    var OrderId: String?
    var ShiftId: Int?
    var PassportId: String?
    var PassportCreated: String?
    var PassportCreatedView: String?
    var CustomerName: String?
    var CompanyName: String?
    var RoomName: String?
    var RoomClassName: String?
    var Address: String?
    var Mobile: String?
    var Email: String?
    var Notes: String?
    var Surcharge: Int?
    var Deductible: Int?
    var Prepaid: Int?
    var Cashed: Int?
    var TotalAmount: Int?
    var InvoiceStatus: Int?
    var InvoiceType: Int?
    var PaymentMethod: Int?
    var HotelId: Int?
    var UserUpdate: String?
    var UserId: Int?
    var CheckInDate: String?
    var CheckInDateView: String?
    var CheckInDateTimeView: String?
    var CheckOutDate: String?
    var CheckOutDateView: String?
    var CheckOutTimeView: String?
    var CreatedDate: String?
    var CreatedDateView: String?
    var UpdatedDate: String?
    var InvoiceService: InvoiceServiceEntity?

    required init?(map: Map) {

    }

    func mapping(map: Map) {

        self.Id <- map["Id"]
        self.OrderId <- map["OrderId"]
        self.ShiftId <- map["ShiftId"]
        self.PassportId <- map["PassportId"]
        self.PassportCreated <- map["PassportCreated"]
        self.PassportCreatedView <- map["PassportCreatedView"]
        self.CustomerName <- map["CustomerName"]
        self.CompanyName <- map["CompanyName"]
        self.RoomName <- map["RoomName"]
        self.RoomClassName <- map["RoomClassName"]
        self.Address <- map["Address"]
        self.Mobile <- map["Mobile"]
        self.Email <- map["Email"]
        self.Notes <- map["Notes"]
        self.Surcharge <- map["Surcharge"]
        self.Deductible <- map["Deductible"]
        self.Prepaid <- map["Prepaid"]
        self.Cashed <- map["Cashed"]
        self.TotalAmount <- map["TotalAmount"]
        self.InvoiceStatus <- map["InvoiceStatus"]
        self.InvoiceType <- map["InvoiceType"]
        self.PaymentMethod <- map["PaymentMethod"]
        self.HotelId <- map["HotelId"]
        self.UserUpdate <- map["UserUpdate"]
        self.UserId <- map["UserId"]
        self.CheckInDate <- map["CheckInDate"]
        self.CheckInDateView <- map["CheckInDateView"]
        self.CheckInDateTimeView <- map["CheckInDateTimeView"]
        self.CheckOutDate <- map["CheckOutDate"]
        self.CheckOutDateView <- map["CheckOutDateView"]
        self.CheckOutTimeView <- map["CheckOutTimeView"]
        self.CreatedDate <- map["CreatedDate"]
        self.CreatedDateView <- map["CreatedDateView"]
        self.UpdatedDate <- map["UpdatedDate"]
        self.InvoiceService <- map["InvoiceDetails"]
    }

}

class InvoiceServiceEntity: Mappable {

    var Id: Int?
    var Unit: String?
    var ServiceId: String?
    var CategoryInvoice: String?
    var CategoryInvoiceView: String?
    var Quantity: Int?
    var Descriptions: String?
    var Price: Int?
    var SubAmount: Int?
    var Notes: String?
    var HotelId: Int?
    var CreatedDate: String?
    var UpdatedDate: String?
    var UserUpdate: String?
    var UserId: Int?

    required init?(map: Map) {

    }

    func mapping(map: Map) {
        self.Id <- map["Id"]
        self.Unit <- map["Unit"]
        self.ServiceId <- map["ServiceId"]
        self.CategoryInvoice <- map["CategoryInvoice"]
        self.CategoryInvoiceView <- map["CategoryInvoiceView"]
        self.Quantity <- map["Quantity"]
        self.Descriptions <- map["Descriptions"]
        self.Price <- map["Price"]
        self.SubAmount <- map["SubAmount"]
        self.Notes <- map["Notes"]
        self.HotelId <- map["HotelId"]
        self.CreatedDate <- map["CreatedDate"]
        self.UpdatedDate <- map["UpdatedDate"]
        self.UserUpdate <- map["UserUpdate"]
        self.UserId <- map["UserId"]
    }

}

