//
//  RevenueDetail.swift
//  Bizkasa
//
//  Created by DINH VAN TIEN on 4/30/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//

import Foundation
import ObjectMapper

class RevenueEntity: Mappable {

    var ByDate      : Int?
    var ThisMonth   : RevenueDetailEntity?
    var ThisWeek    : RevenueDetailEntity?
    var Today       : RevenueDetailEntity?
    var Totals      : Int?
    var Yesterday   : RevenueDetailEntity?

    required init?(map: Map) {

    }

    func mapping(map: Map) {
        self.ByDate         <- map["ByDate"]
        self.ThisMonth      <- map["ThisMonth"]
        self.ThisWeek       <- map["ThisWeek"]
        self.Today          <- map["Today"]
        self.Totals         <- map["Totals"]
        self.Yesterday      <- map["Yesterday"]
    }

}

class RevenueDetailEntity: Mappable {

    var Cashed              : Int?
    var CreatedDate         : String?
    var CreatedDateView     : String?
    var DeductibleAmount    : Int?
    var NumCustomer         : Int?
    var NumRoomUsed         : Int?
    var PrepaidAmount       : Int?
    var RoomAmount          : Int?
    var ServiceAmount       : Int?
    var SurchargeAmount     : Int?

    required init?(map: Map) {

    }

    func mapping(map: Map) {
        self.Cashed             <- map["Cashed"]
        self.CreatedDate        <- map["CreatedDate"]
        self.CreatedDateView    <- map["CreatedDateView"]
        self.DeductibleAmount   <- map["DeductibleAmount"]
        self.NumCustomer        <- map["NumCustomer"]
        self.NumRoomUsed        <- map["NumRoomUsed"]
        self.PrepaidAmount      <- map["PrepaidAmount"]
        self.RoomAmount         <- map["RoomAmount"]
        self.ServiceAmount      <- map["ServiceAmount"]
        self.SurchargeAmount    <- map["SurchargeAmount"]
    }

}
