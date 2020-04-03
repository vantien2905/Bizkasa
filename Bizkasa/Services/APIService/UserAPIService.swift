//
//  PatronAPIService.swift
//  Vebrary
//
//  Created by DINH VAN TIEN on 5/9/19.
//  Copyright © 2019 DINH VAN TIEN. All rights reserved.
//

import Foundation

protocol UserAPIServiceProtocol {
    func login(userName: String, password: String, success: @escaping SuccessHandler<UserEntity>.object, failure: @escaping RequestFailure)
}

class UserAPIService: UserAPIServiceProtocol {

    private let network: APINetworkProtocol
    
    init(network: APINetworkProtocol) {
        self.network = network
    }

    func login(userName: String, password: String, success: @escaping SuccessHandler<UserEntity>.object, failure: @escaping RequestFailure) {
        let endPoint = UserEndPoint.login(userName: userName, password: password)
        network.requestData(endPoint: endPoint, success: MapperData.mapObject(success), failure: failure)
    }
}


