//
//  GetInvoiceParam.swift
//  Bizkasa
//
//  Created by Tien Dinh on 7/3/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//

import Foundation
import ObjectMapper

class GetInvoiceParam: Mappable {

    var FromDate        : String?
    var InvoiceType     : [Int] = []
    var Page            : PageParam?
    var ToDate          : String?
    var IsShowInDay     : Bool?
    var Keyword         : String?
    var PaymentMethod   : Int?
    var InvoiceStatus   : Int?

    required init?(map: Map) {
    }

    init() {
    }

    func mapping(map: Map) {
        self.FromDate       <- map["FromDate"]
        self.InvoiceType    <- map["InvoiceType"]
        self.Page           <- map["Page"]
        self.ToDate         <- map["ToDate"]
        self.IsShowInDay    <- map["IsShowInDay"]
        self.Keyword        <- map["Keyword"]
        self.PaymentMethod <- map["PaymentMethod"]
        self.InvoiceStatus <- map["InvoiceStatus"]
    }
    
    static func setDefaultParam() -> GetInvoiceParam {
        let page = PageParam()
        page.pageSize = 20
        page.currentPage = 1
        let param = GetInvoiceParam()
        param.InvoiceType = [1]
        param.Page = page
        param.IsShowInDay = true
        return param
    }
}

class PageParam: Mappable {
    var currentPage : Int = 0
    var pageSize    : Int = 0
    var total       : Int?

    required init?(map: Map) {

    }

    init() {

    }

    func mapping(map: Map) {
        self.currentPage <- map["currentPage"]
        self.pageSize <- map["pageSize"]
        self.total <- map["total"]
    }
}
