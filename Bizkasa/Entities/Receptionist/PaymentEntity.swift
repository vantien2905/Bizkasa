//
//  PaymentEntity.swift
//  Bizkasa
//
//  Created by Tien Dinh on 7/7/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//

import Foundation
import ObjectMapper

class PaymentEntityResponse: Mappable {

    var payment         : [PaymentEntity] = []
    var TotalRecord     : Int = 0

    required init?(map: Map) {

    }

    func mapping(map: Map) {
        self.payment        <- map["Data"]
        self.TotalRecord    <- map["TotalRecord"]
    }

}

class PaymentEntity: Mappable {

    var CategoryInvoice         : Int?
    var CategoryInvoiceView     : String?
    var CreatedDate             : String?
    var CreatedDateView         : String?
    var CustomerName            : String?
    var Descriptions            : String?
    var HotelId                 : Int?
    var Id                      : Int?
    var InvoiceType             : Int?
    var Notes                   : String?
    var Price                   : Int?
    var Quantity                : Int?
    var ServiceId               : Int?
    var SubAmount               : Int?
    var Unit                    : String?
    var UpdatedDate             : String?
    var UserId                  : Int?
    var UserUpdate              : String?

    required init?(map: Map) {

    }

    func mapping(map: Map) {
        self.CategoryInvoice        <- map["CategoryInvoice"]
        self.CategoryInvoiceView    <- map["CategoryInvoiceView"]
        self.CreatedDate            <- map["CreatedDate"]
        self.CreatedDateView        <- map["CreatedDateView"]
        self.CustomerName           <- map["CustomerName"]
        self.Descriptions           <- map["Descriptions"]
        self.HotelId                <- map["HotelId"]
        self.Id                     <- map["Id"]
        self.InvoiceType            <- map["InvoiceType"]
        self.Notes                  <- map["Notes"]
        self.Price                  <- map["Price"]
        self.Quantity               <- map["Quantity"]
        self.ServiceId              <- map["ServiceId"]
        self.SubAmount              <- map["SubAmount"]
        self.Unit                   <- map["Unit"]
        self.UpdatedDate            <- map["UpdatedDate"]
        self.UserId                 <- map["UserId"]
        self.UserUpdate             <- map["UserUpdate"]
    }

}

