//
//  EndPointType.swift
//  Vebrary
//
//  Created by DINH VAN TIEN on 5/2/19.
//  Copyright © 2019 DINH VAN TIEN. All rights reserved.
//

import Foundation
import Alamofire

let limitLoad = 20
typealias JSONDictionary = [String: Any]

protocol EndPointType {
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var parameters: JSONDictionary { get }
    var headers: HTTPHeaders? { get }
}

struct DefaultHeader {
    func addAuthHeader() -> [String: String] {
        var header: [String: String] = ["Content-Type": "application/json"]
//        if let authenticate = UserDefaultHelper.shared.get(key: AppKey.authenticatedUserDepartment) {
//            header[AppKey.authenticatedUserDepartment] = authenticate
////            header["User-Agent"] = "com.pvgas"
//        }
        return header
    }
}
