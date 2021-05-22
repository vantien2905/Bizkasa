//
//  WidgetType.swift
//  Bizkasa
//
//  Created by DINH VAN TIEN on 3/21/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//

import Foundation
import ObjectMapper

class WidgetTypeEntity: Mappable {

    var HotelId         : Int?
    var GroupId         : Int?
    var GroupName       : String?
    var Widgets         : [WidgetEntity] = []

    required init?(map: Map) {

    }

    func mapping(map: Map) {
        self.HotelId        <- map["HotelId"]
        self.GroupId        <- map["GroupId"]
        self.GroupName      <- map["GroupName"]
        self.Widgets        <- map["Widgets"]
    }

}

class WidgetEntity: Mappable {

    var Id              : Int?
    var HotelId         : Int?
    var GroupId         : Int?
    var GroupName       : String?
    var Name            : String?
    var IsRecept        : Bool?
    var Price           : Int?
    var PricePaid       : Int?
    var NumImport       : Int?
    var NumExport       : Int?
    var Residual        : Int?
    var Note            : String?
    var NamePrice       : String?
    var Quantity        : Int?
    var Descriptions    : String?
    var CategoryInvoice : Int?
    var SubAmount       : String?

    required init?(map: Map) {

    }
    
    init() {
    }

    func mapping(map: Map) {
        self.Id             <- map["Id"]
        self.HotelId        <- map["HotelId"]
        self.GroupId        <- map["GroupId"]
        self.GroupName      <- map["GroupName"]
        self.Name           <- map["Name"]
        self.IsRecept       <- map["IsRecept"]
        self.Price          <- map["Price"]
        self.PricePaid      <- map["PricePaid"]
        self.NumImport      <- map["NumImport"]
        self.NumExport      <- map["NumExport"]
        self.Residual       <- map["Residual"]
        self.Note           <- map["Note"]
        self.NamePrice      = "\(self.Name&) (\(self.PricePaid ?? 0))"
        self.Quantity       <- map["Quantity"]
        self.Descriptions   <- map["Descriptions"]
        self.CategoryInvoice <- map["CategoryInvoice"]
        self.SubAmount      <- map["SubAmount"]

    }

}
