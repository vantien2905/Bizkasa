//
//  AddCustomerParam.swift
//  Bizkasa
//
//  Created by DINH VAN TIEN on 4/26/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//

import Foundation
import ObjectMapper

class AddCustomerParam: Mappable {

    var Address: String?
    var Name: String?
    var OrderId: Int?
    var PassportCreatedDate: String?
    var PassportId: String?

    required init?(map: Map) {

    }

    init() {

    }

    func mapping(map: Map) {
        self.Address <- map["Address"]
        self.Name <- map["Name"]
        self.OrderId <- map["OrderId"]
        self.PassportCreatedDate <- map["PassportCreatedDate"]
        self.PassportId <- map["PassportId"]
    }


}
