//
//  Provider.swift
//  Vebrary
//
//  Created by DINH VAN TIEN on 5/6/19.
//  Copyright © 2019 DINH VAN TIEN. All rights reserved.
//

import Foundation

class Provider {
    static let shared = Provider()

    private let request: NetworkRequestProtocol = NetworkRequest()

    private var networkManager: APINetworkProtocol {
        return APINetwork(request: request)
    }

    var userAPIService: UserAPIServiceProtocol {
        return UserAPIService(network: networkManager)
    }

    var receptionistAPIService: ReceptionistAPIServiceProtocol {
        return ReceptionistAPIService(network: networkManager)
    }
    
    var paymentAPIService: PaymentAPIServiceProtocol {
        return PaymentAPIService(network: networkManager)
    }
    
    var roomManagementAPIService: RoomManagementAPIServiceProtocol {
        return RoomManagementAPIService(network: networkManager)
    }
    
    var serviceAPIService: ServiceAPIServiceProtocol {
        return ServiceAPIService(network: networkManager)
    }
    
    var rateSettingAPIService: RateSettingAPIServiceProtocol {
        return RateSettingAPIService(network: networkManager)
    }
}
