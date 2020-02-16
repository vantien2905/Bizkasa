//
//  Network.swift
//  Vebrary
//
//  Created by DINH VAN TIEN on 5/2/19.
//  Copyright © 2019 DINH VAN TIEN. All rights reserved.
//

import Foundation
import ObjectMapper
import SwiftyJSON
import Alamofire

/***
 Input: endPoint (all info to request)
 Ouput: BaseResponse or error
 ***/

protocol APINetworkProtocol {
    func requestData(endPoint: EndPointType, success: @escaping NetworkSuccess, failure: @escaping RequestFailure)
    func requestSecretKey(endPoint: EndPointType, success: @escaping NetworkSuccess, failure: @escaping RequestFailure)
    //    func uploadImages(image: UIImage, endPoint: EndPointType, success: @escaping NetworkSuccess, failure: @escaping RequestFailure)
    //    func uploadAvatar(image: UIImage, endPoint: EndPointType, success: @escaping NetworkSuccess, failure: @escaping RequestFailure)
}

struct APINetwork: APINetworkProtocol {
    let request: NetworkRequestProtocol

    init(request: NetworkRequestProtocol) {
        self.request = request
    }

    func requestData(endPoint: EndPointType, success: @escaping NetworkSuccess, failure: @escaping RequestFailure) {
        print("\n******************_____Parameter_____*********************\n")
        print(endPoint.parameters)

        if !UtilsHelper.isConnectedToInternet() {
            print("Not connect internet")
            return
        }

        ProgressView.shared.show()
        request.requestData(endPoint: endPoint, success: { data in
            let json = JSON(data)

            if json.description == "null" {
                print("\n**************_____ERROR_____*****************\n")
                print(String(data: data, encoding: .utf8))
            } else {
                print("\n**************_____SUCCESS_____*****************\n")
                print(json)
            }

            if let dic = json.dictionaryObject, let encryptString = dic["d"] as? String {
                let decryptString = DecryptHelper.shared.decryptAES(cleanText: encryptString)&
                do {
                    let decryptJson =  try JSONSerialization.jsonObject(with: decryptString.data(using: .utf8)!, options: []) as? [String: Any]
                    guard let result = Mapper<BaseResponse>().map(JSONObject: decryptJson) else {
                        failure(APPError.canNotParseData)
                        ProgressView.shared.hide()
                        return
                    }
                    self.handleResponse(response: result, success: success, failure: failure)
                    ProgressView.shared.hide()
                } catch let error as NSError {
                    print(error)
                    failure(APPError.canNotParseData)
                    ProgressView.shared.hide()
                    return
                }
            } else {
                //-- Result no format BaseResponse, only string encrypt
                //Hard code need fix again
                let encryptString = String(data: data, encoding: .utf8)
                let fix = encryptString?.replacingOccurrences(of: "\"", with: "")
                let decryptString = DecryptHelper.shared.decryptAES(cleanText: fix&)&
                do {
                    let decryptJson =  try JSONSerialization.jsonObject(with: decryptString.data(using: .utf8)!, options: []) as? [String: Any]
                    guard let result = Mapper<BaseResponse>().map(JSONObject: decryptJson) else {
                        failure(APPError.canNotParseData)
                        ProgressView.shared.hide()
                        return
                    }
                    self.handleResponse(response: result, success: success, failure: failure)
                    ProgressView.shared.hide()
                } catch let error as NSError {
                    print(error)
                    failure(APPError.canNotParseData)
                    ProgressView.shared.hide()
                    return
                }
            }
        }) { error in
            print("APINetwork - requestData: \(String(describing: error?.code?.description&))")
            failure(APIError(error: error))
            ProgressView.shared.hide()
        }
    }

    func requestSecretKey(endPoint: EndPointType, success: @escaping NetworkSuccess, failure: @escaping RequestFailure) {
        print("\n******************_____Parameter_____*********************\n")
        print(endPoint.parameters)
        ProgressView.shared.show()
        request.requestData(endPoint: endPoint, success: { data in
            let json = JSON(data)

            if json.description == "null" {
                print("\n**************_____ERROR_____*****************\n")
                print(String(data: data, encoding: .utf8))
            } else {
                print("\n**************_____SUCCESS_____*****************\n")
                print(json)
            }

            guard let result = Mapper<BaseResponse>().map(JSONObject: json.dictionaryObject) else {
                failure(APPError.canNotParseData)
                ProgressView.shared.hide()
                return
            }

            self.handleResponse(response: result, success: success, failure: failure)
            ProgressView.shared.hide()
        }) { error in
            print("APINetwork - requestData: \(String(describing: error?.code?.description&))")
            failure(APIError(error: error))
            ProgressView.shared.hide()

        }
    }
}

// handle base response
extension APINetwork {
    private func handleResponse(response: BaseResponse, success: @escaping NetworkSuccess, failure: @escaping RequestFailure) {
        if response.status == 200 || response.status == nil || response.status == 1 {
            success(response)
        } else {
            // handle error with message from API
            let error = APIError(baseResponse: response)
            failure(error)
        }
    }
}
