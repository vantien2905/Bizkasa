//
//  RegisterParam.swift
//  Bizkasa
//
//  Created by DINH VAN TIEN on 4/30/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//

import Foundation
import ObjectMapper

class CompleteRegisterParam: Mappable {

    var hotelId         : Int?
    var Name            : String?
    var Email           : String?
    var Phone           : String?
    var Address         : String?

    required init?(map: Map) {

    }

    init() {

    }

    func mapping(map: Map) {
        self.hotelId        <- map["Id"]
        self.Name           <- map["Name"]
        self.Email          <- map["Email"]
        self.Phone          <- map["Phone"]
        self.Address        <- map["Address"]
    }
}


class RegisterParam: Mappable {

    var IsChecked       : Bool = true
    var User            : UserInfoParam?

    required init?(map: Map) {

    }

    init() {

    }

    func mapping(map: Map) {
        self.IsChecked  <- map["IsChecked"]
        self.User       <- map["User"]
    }
}

class UserInfoParam: Mappable {

    var userName: String?
    var password: String?

    required init?(map: Map) {

    }

    init() {

    }

    func mapping(map: Map) {
        self.userName <- map["Email"]
        self.password <- map["Password"]
    }
}

