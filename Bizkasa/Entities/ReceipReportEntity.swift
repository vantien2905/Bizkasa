//
//  ReceipReportEntity.swift
//  Bizkasa
//
//  Created by DINH VAN TIEN on 4/5/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//

import Foundation
import ObjectMapper

class ReceipReportEntity: Mappable {

    var Amount: Int?
    var CreatedDate: String?
    var CreatedDateView: String?

    required init?(map: Map) {

    }

    func mapping(map: Map) {
        self.Amount <- map["Amount"]
        self.CreatedDate <- map["CreatedDate"]
        self.CreatedDateView <- map["CreatedDateView"]
    }


}
