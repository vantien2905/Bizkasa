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
    func getReceiptReport(period: Int, success: @escaping SuccessHandler<ReceipReportEntity>.array, failure: @escaping RequestFailure)
    func reportRevenue(shiftID: Int, success: @escaping SuccessHandler<RevenueEntity>.object, failure: @escaping RequestFailure)
    func register(param: RegisterParam, success: @escaping SuccessHandler<UserEntity>.object, failure: @escaping RequestFailure)
    func completedRegiser(param: CompleteRegisterParam, success: @escaping SuccessHandler<UserEntity>.object, failure: @escaping RequestFailure)
}

class UserAPIService: UserAPIServiceProtocol {

    func completedRegiser(param: CompleteRegisterParam, success: @escaping SuccessHandler<UserEntity>.object, failure: @escaping RequestFailure) {
        let endPoint = UserEndPoint.completedRegiser(param: param)
        network.requestData(endPoint: endPoint, success: MapperData.mapObject(success), failure: failure)
    }

    func register(param: RegisterParam, success: @escaping SuccessHandler<UserEntity>.object, failure: @escaping RequestFailure) {
        let endPoint = UserEndPoint.register(param: param)
        network.requestData(endPoint: endPoint, success: MapperData.mapObject(success), failure: failure)
    }

    func reportRevenue(shiftID: Int, success: @escaping SuccessHandler<RevenueEntity>.object, failure: @escaping RequestFailure) {
        let endPoint = UserEndPoint.reportRevenue(shiftID: shiftID)
        network.requestData(endPoint: endPoint, success: MapperData.mapObject(success), failure: failure)
    }

    func getReceiptReport(period: Int, success: @escaping SuccessHandler<ReceipReportEntity>.array, failure: @escaping RequestFailure) {
        let endPoint = UserEndPoint.getReceiptReport(period: period)
        network.requestData(endPoint: endPoint, success: MapperData.mapArray(success), failure: failure)
    }

    private let network: APINetworkProtocol
    
    init(network: APINetworkProtocol) {
        self.network = network
    }

    func login(userName: String, password: String, success: @escaping SuccessHandler<UserEntity>.object, failure: @escaping RequestFailure) {
        let endPoint = UserEndPoint.login(userName: userName, password: password)
        network.requestData(endPoint: endPoint, success: MapperData.mapObject(success), failure: failure)
    }
}


