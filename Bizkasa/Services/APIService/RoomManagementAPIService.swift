//
//  RoomManagementAPIService.swift
//  Bizkasa
//
//  Created by Tien Dinh on 7/19/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//

import Foundation

protocol RoomManagementAPIServiceProtocol {
    func getFloorWithRoom(token: String, success: @escaping SuccessHandler<FloorEntity>.array, failure: @escaping RequestFailure)
}

class RoomManagementAPIService: RoomManagementAPIServiceProtocol {
    
    func getFloorWithRoom(token: String, success: @escaping SuccessHandler<FloorEntity>.array, failure: @escaping RequestFailure) {
        let endPoint = RoomManagementEndPoint.getFloorWithRoom(token: token)
        network.requestData(endPoint: endPoint, success: MapperData.mapArray(success), failure: failure)
    }

    private let network: APINetworkProtocol
    
    init(network: APINetworkProtocol) {
        self.network = network
    }
}
