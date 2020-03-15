//
//  UserEntity.swift
//  Bizkasa
//
//  Created by DINH VAN TIEN on 2/22/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//

import ObjectMapper

class UserEntity: Mappable {

    var UserName: String?
    var FullName: String?
    var HotelName: String?
    var Logo: String?
    var UserType: String?
    var Id: String?
    var ShiftId: String?
    var IsInShift: String?
    var HotelId: String?
    var OwnerHotels: String?
    var AuthToken: String?
    var Email: String?

    required init?(map: Map) {

    }

    func mapping(map: Map) {
        self.UserName <- map["UserName"]
        self.FullName <- map["FullName"]
        self.HotelName <- map["HotelName"]
        self.Logo <- map["Logo"]
        self.UserType <- map["UserType"]
        self.Id <- map["Id"]
        self.ShiftId <- map["ShiftId"]
        self.IsInShift <- map["IsInShift"]
        self.HotelId <- map["HotelId"]
        self.OwnerHotels <- map["OwnerHotels"]
        self.AuthToken <- map["Token.AuthToken"]
        self.Email <- map["Email"]
    }

}

class HotelEntity: Mappable {

    var HotelId: Int?
    var HotelName: String?
    var IsSelected: Bool = false
    var DateExpired: String?

    required init?(map: Map) {

    }

    func mapping(map: Map) {
        self.HotelId <- map["HotelId"]
        self.HotelName <- map["HotelName"]
        self.IsSelected <- map["IsSelected"]
        self.DateExpired <- map["DateExpired"]
    }

}


