//
//  ServiceAPIService.swift
//  Bizkasa
//
//  Created by Tien Dinh on 8/23/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//

import Foundation
protocol ServiceAPIServiceProtocol {
    func deleteWedget(listID: [Int], success: @escaping SuccessHandler<BaseResponse>.object, failure: @escaping RequestFailure)
}

class ServiceAPIService: ServiceAPIServiceProtocol {
    
    func deleteWedget(listID: [Int], success: @escaping SuccessHandler<BaseResponse>.object, failure: @escaping RequestFailure) {
        let endPoint = ServiceEndPoint.deleteWedget(listID: listID)
        network.requestData(endPoint: endPoint, success: MapperData.mapObject(success), failure: failure)
    }

    private let network: APINetworkProtocol
    
    init(network: APINetworkProtocol) {
        self.network = network
    }
}
