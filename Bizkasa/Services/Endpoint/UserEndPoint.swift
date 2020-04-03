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
}

extension UserEndPoint: EndPointType {
    var path: String {
        switch self {
        case .login:
            return "api/Account/login"
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
        }
    }

    var headers: HTTPHeaders? {
        return DefaultHeader().addAuthHeader()
    }
}
