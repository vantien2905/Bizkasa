//
//  ServiceEndpoint.swift
//  Bizkasa
//
//  Created by Tien Dinh on 8/23/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//

import Foundation
import Alamofire

enum ServiceEndPoint {
    case deleteWedget(listID: [Int])
}

extension ServiceEndPoint: EndPointType {
    var path: String {
        switch self {
        case .deleteWedget:
            return "Widget/DeleteWidget"
        
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
        case .deleteWedget(let listID):
            return ["Ids": listID]
        }
    }

    var headers: HTTPHeaders? {
        return DefaultHeader().addAuthHeader()
    }
}
