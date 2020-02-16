//
//  PatronAPIService.swift
//  Vebrary
//
//  Created by DINH VAN TIEN on 5/9/19.
//  Copyright © 2019 DINH VAN TIEN. All rights reserved.
//

import Foundation

protocol UserAPIServiceProtocol {
    func getSecretKey(success: @escaping SuccessHandler<BaseResponse>.object, failure: @escaping RequestFailure)
}

class UserAPIService: UserAPIServiceProtocol {

    private let network: APINetworkProtocol
    
    init(network: APINetworkProtocol) {
        self.network = network
    }

    func getSecretKey(success: @escaping SuccessHandler<BaseResponse>.object, failure: @escaping RequestFailure) {
        let endPoint = UserEndPoint.getSecretKey
        network.requestSecretKey(endPoint: endPoint, success: MapperData.mapNoData(success), failure: failure)
    }
}


