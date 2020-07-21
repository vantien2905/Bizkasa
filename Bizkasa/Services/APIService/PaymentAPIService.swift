//
//  PaymentAPIService.swift
//  Bizkasa
//
//  Created by Tien Dinh on 7/7/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//

import Foundation

protocol PaymentAPIServiceProtocol {
    func getInvoiceByPayment(param: GetInvoiceParam, success: @escaping SuccessHandler<PaymentEntityResponse>.object, failure: @escaping RequestFailure)
}

class PaymentAPIService: PaymentAPIServiceProtocol {
    
    func getInvoiceByPayment(param: GetInvoiceParam, success: @escaping SuccessHandler<PaymentEntityResponse>.object, failure: @escaping RequestFailure) {
        let endPoint = PaymentEndPoint.getInvoiceByPayment(param: param)
        network.requestData(endPoint: endPoint, success: MapperData.mapObject(success), failure: failure)
    }

    private let network: APINetworkProtocol
    
    init(network: APINetworkProtocol) {
        self.network = network
    }
}


