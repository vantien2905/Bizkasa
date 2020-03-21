//
//  ReceptionAPIService.swift
//  Bizkasa
//
//  Created by DINH VAN TIEN on 3/15/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//

import Foundation

protocol ReceptionistAPIServiceProtocol {
    func getListCustomerCheckIn(success: @escaping SuccessHandler<CustomerCheckInEntity>.object, failure: @escaping RequestFailure)
    func getInvoices(page: Int, pageSize: Int, invoiceType: Int, isInDay: Bool, success: @escaping SuccessHandler<InvoiceResponse>.object, failure: @escaping RequestFailure)
    func getRoomsByClass(success: @escaping SuccessHandler<RoomTypeEntity>.array, failure: @escaping RequestFailure)
    func getConfigPrice(roomId: Int, success: @escaping SuccessHandler<ConfigPriceEntity>.array, failure: @escaping RequestFailure)
    func getWidget(success: @escaping SuccessHandler<WidgetTypeEntity>.array, failure: @escaping RequestFailure)
    func getOrderForCheckOut(orderId: Int, mode: Int, success: @escaping SuccessHandler<OrderInfoEntity>.object, failure: @escaping RequestFailure)
}

class ReceptionistAPIService: ReceptionistAPIServiceProtocol {

    func getOrderForCheckOut(orderId: Int, mode: Int, success: @escaping SuccessHandler<OrderInfoEntity>.object, failure: @escaping RequestFailure) {
        let endPoint = ReceptionistEndPoint.getOrderForCheckOut(orderId: orderId, mode: mode)
        network.requestData(endPoint: endPoint, success: MapperData.mapObject(success), failure: failure)
    }

    func getWidget(success: @escaping SuccessHandler<WidgetTypeEntity>.array, failure: @escaping RequestFailure) {
        let endPoint = ReceptionistEndPoint.getWidget
        network.requestData(endPoint: endPoint, success: MapperData.mapArray(success), failure: failure)
    }

    func getConfigPrice(roomId: Int, success: @escaping SuccessHandler<ConfigPriceEntity>.array, failure: @escaping RequestFailure) {
        let endPoint = ReceptionistEndPoint.getConfigPrice(roomId: roomId)
        network.requestData(endPoint: endPoint, success: MapperData.mapArray(success), failure: failure)
    }

    func getRoomsByClass(success: @escaping SuccessHandler<RoomTypeEntity>.array, failure: @escaping RequestFailure) {
        let endPoint = ReceptionistEndPoint.getRoomsByClass
        network.requestData(endPoint: endPoint, success: MapperData.mapArray(success), failure: failure)
    }

    func getInvoices(page: Int, pageSize: Int, invoiceType: Int, isInDay: Bool, success: @escaping SuccessHandler<InvoiceResponse>.object, failure: @escaping RequestFailure) {
        let endPoint = ReceptionistEndPoint.getInvoices(page: page, pageSize: pageSize, invoiceType: invoiceType, isInDay: isInDay)
        network.requestData(endPoint: endPoint, success: MapperData.mapObject(success), failure: failure)
    }

    func getListCustomerCheckIn(success: @escaping SuccessHandler<CustomerCheckInEntity>.object, failure: @escaping RequestFailure) {
        let endPoint = ReceptionistEndPoint.getListCustomerCheckIn
        network.requestData(endPoint: endPoint, success: MapperData.mapObject(success), failure: failure)
    }

    private let network: APINetworkProtocol

    init(network: APINetworkProtocol) {
        self.network = network
    }
}
