//
//  InsertInvoiceParam.swift
//  Bizkasa
//
//  Created by DINH VAN TIEN on 4/5/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//

import Foundation
import ObjectMapper

class InsertInvoiceParam: Mappable {

    var TotalAmount: Int?
    var invoiceDetails: [WidgetParam] = []
    var InvoiceType: Int?
    var InvoiceStatus: Int?
    var CustomerName: String?
    var Cashed: Int?

    required init?(map: Map) {
    }

    init() {
    }

    func mapping(map: Map) {
        self.TotalAmount <- map["TotalAmount"]
        self.invoiceDetails <- map["invoiceDetails"]
        self.InvoiceType <- map["InvoiceType"]
        self.InvoiceStatus <- map["InvoiceStatus"]
        self.CustomerName <- map["CustomerName"]
        self.Cashed <- map["Cashed"]
    }

}

class WidgetParam: Mappable {
    var Title: String?
    var RelatedId: Int?
    var Descriptions: String?
    var Price: Int?
    var Quantity: Int?
    var SubAmount: Int?
    var CategoryInvoice: Int?

    required init?(map: Map) {

    }

    init() {

    }

    func mapping(map: Map) {
        self.Title <- map["Title"]
        self.RelatedId <- map["RelatedId"]
        self.Descriptions <- map["Descriptions"]
        self.Price <- map["Price"]
        self.Quantity <- map["Quantity"]
        self.SubAmount <- map["SubAmount"]
        self.CategoryInvoice <- map["CategoryInvoice"]
    }
}
