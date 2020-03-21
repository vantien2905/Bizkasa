//
//  CustomerCheckIn.swift
//  Bizkasa
//
//  Created by DINH VAN TIEN on 3/14/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//

import ObjectMapper

class CustomerCheckInEntity: Mappable {

    var data: [CustomerEntity] = []
    var total: Int?


    required init?(map: Map) {

    }

    func mapping(map: Map) {
        self.data <- map["Data"]
        self.total <- map["TotalRecord"]
    }

}

class CustomerEntity: Mappable {

    var Id: Int?
    var RoomName: String?
    var PassportId: String?
    var RoomClassName: String?
    var Name: String?
    var Address: String?
    var Notes: String?
    var Mobile: String?
    var Email: String?
    var OrderIds: String?
    var CheckInDate: String?
    var CheckInDateView: String?
    var CheckOutDate: String?
    var PassportCreatedDate: String?
    var PassportAgency: String?
    var CustomerType: String?
    var National: String?

    required init?(map: Map) {

    }

    func mapping(map: Map) {
        self.Id <- map["Id"]
        self.RoomName <- map["RoomName"]
        self.PassportId <- map["PassportId"]
        self.RoomClassName <- map["RoomClassName"]
        self.Name <- map["Name"]
        self.Address <- map["Address"]
        self.Notes <- map["Notes"]
        self.Mobile <- map["Mobile"]
        self.Email <- map["Email"]
        self.OrderIds <- map["OrderIds"]
        self.CheckInDate <- map["CheckInDate"]
        self.CheckInDateView <- map["CheckInDateView"]
        self.CheckOutDate <- map["CheckOutDate"]
        self.PassportCreatedDate <- map["PassportCreatedDate"]
        self.PassportAgency <- map["PassportAgency"]
        self.CustomerType <- map["CustomerType"]
        self.National <- map["National"]
    }

}
