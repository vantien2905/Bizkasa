//
//  PaymentEndPoint.swift
//  Bizkasa
//
//  Created by Tien Dinh on 7/7/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//

import Foundation
import Alamofire

enum PaymentEndPoint {
    case getInvoiceByPayment(param: GetInvoiceParam)
}

extension PaymentEndPoint: EndPointType {
    var path: String {
        switch self {
        case .getInvoiceByPayment:
            return "api/Invoice/GetInvoiceByPayment"
        
        }
    }

    var httpMethod: HTTPMethod {
        switch self {
        default:
            return .post
        }
    }

    var parameters: JSONDictionary {
        switch self {
        case .getInvoiceByPayment(let param):
            return param.toJSON()
        }
    }

    var headers: HTTPHeaders? {
        return DefaultHeader().addAuthHeader()
    }
}
