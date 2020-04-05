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
}

extension UserEndPoint: EndPointType {
    var path: String {
        switch self {
        case .login:
            return "api/Account/login"
        case .getReceiptReport:
            return "api/Report/GetReceiptReport"
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
        }
    }

    var headers: HTTPHeaders? {
        return DefaultHeader().addAuthHeader()
    }
}
