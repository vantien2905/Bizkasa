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
    func getWidget(type: Int, success: @escaping SuccessHandler<WidgetTypeEntity>.array, failure: @escaping RequestFailure)
    func getOrderForCheckOut(orderId: Int, mode: Int, success: @escaping SuccessHandler<OrderInfoEntity>.object, failure: @escaping RequestFailure)
    func addOrderDetail(param: SubFeeDetailEntity, success: @escaping SuccessHandler<BaseResponse>.object, failure: @escaping RequestFailure)
    func deleteOrderDetail(param: SubFeeDetailEntity, success: @escaping SuccessHandler<BaseResponse>.object, failure: @escaping RequestFailure)
    func updateOrder(param: OrderInfoEntity, success: @escaping SuccessHandler<BaseResponse>.object, failure: @escaping RequestFailure)
    func addOrder(param: CheckInParam, success: @escaping SuccessHandler<BaseResponse>.object, failure: @escaping RequestFailure)
    func changCalculatorMode(orderID: Int, mode: Int, hotelID: Int, success: @escaping SuccessHandler<OrderInfoEntity>.object, failure: @escaping RequestFailure)
}

class ReceptionistAPIService: ReceptionistAPIServiceProtocol {

    func changCalculatorMode(orderID: Int, mode: Int, hotelID: Int, success: @escaping SuccessHandler<OrderInfoEntity>.object, failure: @escaping RequestFailure) {
        let endPoint = ReceptionistEndPoint.changCalculatorMode(orderID: orderID, mode: mode, hotelID: hotelID)
        network.requestData(endPoint: endPoint, success: MapperData.mapObject(success), failure: failure)
    }

    func addOrder(param: CheckInParam, success: @escaping SuccessHandler<BaseResponse>.object, failure: @escaping RequestFailure) {
        let endPoint = ReceptionistEndPoint.addOrder(param: param)
        network.requestData(endPoint: endPoint, success: MapperData.mapNoData(success), failure: failure)
    }

    func updateOrder(param: OrderInfoEntity, success: @escaping SuccessHandler<BaseResponse>.object, failure: @escaping RequestFailure) {
        let endPoint = ReceptionistEndPoint.updateOrder(param: param)
        network.requestData(endPoint: endPoint, success: MapperData.mapNoData(success), failure: failure)
    }

    func addOrderDetail(param: SubFeeDetailEntity, success: @escaping SuccessHandler<BaseResponse>.object, failure: @escaping RequestFailure) {
        let endPoint = ReceptionistEndPoint.addOrderDetail(param: param)
        network.requestData(endPoint: endPoint, success: MapperData.mapNoData(success), failure: failure)
    }

    func deleteOrderDetail(param: SubFeeDetailEntity, success: @escaping SuccessHandler<BaseResponse>.object, failure: @escaping RequestFailure)  {
        let endPoint = ReceptionistEndPoint.deleteOrderDetail(param: param)
        network.requestData(endPoint: endPoint, success: MapperData.mapNoData(success), failure: failure)
    }

    func getOrderForCheckOut(orderId: Int, mode: Int, success: @escaping SuccessHandler<OrderInfoEntity>.object, failure: @escaping RequestFailure) {
        let endPoint = ReceptionistEndPoint.getOrderForCheckOut(orderId: orderId, mode: mode)
        network.requestData(endPoint: endPoint, success: MapperData.mapObject(success), failure: failure)
    }

    func getWidget(type: Int, success: @escaping SuccessHandler<WidgetTypeEntity>.array, failure: @escaping RequestFailure) {
        let endPoint = ReceptionistEndPoint.getWidget(type: type)
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
