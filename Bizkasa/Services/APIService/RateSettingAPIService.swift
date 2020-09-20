//
//  RateSettingAPIService.swift
//  Bizkasa
//
//  Created by Tien Dinh on 9/20/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//

import Foundation
protocol RateSettingAPIServiceProtocol {
    func getRoomClass(success: @escaping SuccessHandler<RateSettingEntity>.array, failure: @escaping RequestFailure)
}

class RateSettingAPIService: RateSettingAPIServiceProtocol {
    
    func getRoomClass(success: @escaping SuccessHandler<RateSettingEntity>.array, failure: @escaping RequestFailure) {
        let endPoint = RateSettingEndPoint.getRoomClass
        network.requestData(endPoint: endPoint, success: MapperData.mapArray(success), failure: failure)
    }
    
    func deleteWedget(listID: [Int], success: @escaping SuccessHandler<BaseResponse>.object, failure: @escaping RequestFailure) {
        let endPoint = ServiceEndPoint.deleteWedget(listID: listID)
        network.requestData(endPoint: endPoint, success: MapperData.mapObject(success), failure: failure)
    }

    private let network: APINetworkProtocol
    
    init(network: APINetworkProtocol) {
        self.network = network
    }
}
