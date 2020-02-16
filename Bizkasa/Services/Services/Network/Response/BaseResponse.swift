//
//  BaseResponse.swift
//  Vebrary
//
//  Created by DINH VAN TIEN on 5/2/19.
//  Copyright © 2019 DINH VAN TIEN. All rights reserved.
//

import ObjectMapper

// Base
class BaseResponse: Mappable {
    var status: Int?
    var message: String?
    var data: Any?
    var key: String?

    required init?(map: Map) {
        mapping(map: map)
    }

    func mapping(map: Map) {
        status      <- map["Status"]
        message     <- map["Message"]
        data        <- map["Data"]
        key         <- map["d"]
    }
}

class BaseResponseOld: Mappable {
    var status: Int?
    var message: String?
    var key: String?

    required init?(map: Map) {
        mapping(map: map)
    }

    func mapping(map: Map) {
        status      <- map["Status"]
        message     <- map["Message"]
        key         <- map["d"]
    }
}

