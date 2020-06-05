//
//  PatronEndPoint.swift
//  Vebrary
//
//  Created by DINH VAN TIEN on 5/9/19.
//  Copyright © 2019 DINH VAN TIEN. All rights reserved.
//

import Alamofire

enum UserEndPoint {
    case login(userName: String, password: String)
    case getReceiptReport(period: Int)
    case reportRevenue(shiftID: Int)
    case register(param: RegisterParam)
    case completedRegiser(param: CompleteRegisterParam)
}

extension UserEndPoint: EndPointType {
    var path: String {
        switch self {
        case .login:
            return "api/Account/login"
        case .getReceiptReport:
            return "api/Report/GetReceiptReport"
        case .reportRevenue:
            return "api/Report/Revenue"
        case .register:
            return "/api/Account/RegisterHotel"
        case .completedRegiser:
            return "/api/Hotel/CompletedRegiser"
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
        case .login(let userName, let password):
            return ["UserName": userName,
                    "Password": password]
        case .getReceiptReport(let period):
            return ["Period": period]
        case .reportRevenue(let shiftID):
            return ["ShiftId": shiftID]
        case .register(let param):
            return param.toJSON()
        case .completedRegiser(let param):
            return param.toJSON()
        }
    }

    var headers: HTTPHeaders? {
        return DefaultHeader().addAuthHeader()
    }
}
