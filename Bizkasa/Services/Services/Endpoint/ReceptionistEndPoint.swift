//
//  ReceptionistEndPoint.swift
//  Bizkasa
//
//  Created by DINH VAN TIEN on 3/14/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//

import Foundation
import Alamofire



enum ReceptionistEndPoint {
    case getListCustomerCheckIn
    case getInvoices(page: Int, pageSize: Int, invoiceType: Int, isInDay: Bool)
    case getRoomsByClass
}

extension ReceptionistEndPoint: EndPointType {
    var path: String {
        switch self {
        case .getListCustomerCheckIn:
            return "api/Customer/GetListCustomerCheckIn"
        case .getInvoices:
            return "/api/Invoice/GetInvoices"
        case .getRoomsByClass:
            return "/api/Room/GetRoomsByClass"
        }
    }

    var httpMethod: HTTPMethod {
        switch self {
        case .getRoomsByClass:
            return .get
        default:
            return .post
        }
    }

    var parameters: JSONDictionary {
        switch self {
        case .getListCustomerCheckIn, .getRoomsByClass:
            return [:]
        case .getInvoices(let page, let pageSize, let invoiceType, let isInDay):
            let param = ["Page": [
                "currentPage": page,
                "pageSize": pageSize
                ] ,
                         "InvoiceType": invoiceType,
                         "IsShowInDay": isInDay
                ] as [String : Any]
            return param
        }
    }

    var headers: HTTPHeaders? {
        return DefaultHeader().addAuthHeader()
    }
}
