//
//  APIError.swift
//  Vebrary
//
//  Created by DINH VAN TIEN on 5/2/19.
//  Copyright © 2019 DINH VAN TIEN. All rights reserved.
//

import UIKit

// MARK APPError
struct APPError {
    static let canNotParseData = APIError(message: ["Can Not Parse Data"])
}

// MARK: APIError class
class APIError: Error {
    let code: Int?
    let message: [String]?
    var data: Any? = nil

    init(code: Int?, message: [String]?) {
        self.code = code
        self.message = message
    }

    init(message: [String]?) {
        self.message = message
        self.code = nil
    }

    var codeVerify: String {
        if let _json = data as? [String: String] {
            return _json["code_verify"]&
        }
        return ""
    }

    init(baseResponse: BaseResponse) {
        self.code = baseResponse.status
        self.message = baseResponse.message
        self.data = baseResponse.data
    }

    init(error: Error?) {
        self.code = nil
        self.message = [(error?.localizedDescription ?? "")]
    }
}
