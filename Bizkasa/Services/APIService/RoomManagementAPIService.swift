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
    func deleteFloor(id: Int, success: @escaping SuccessHandler<BaseResponse>.object, failure: @escaping RequestFailure)
    func insertOrUpdateFloor(param: InsertOrUpdateFloorParam, success: @escaping SuccessHandler<BaseResponse>.object, failure: @escaping RequestFailure)
    func editRoom(param: EditRoomParam, success: @escaping SuccessHandler<BaseResponse>.object, failure: @escaping RequestFailure)
    func deleteRoom(id: Int, success: @escaping SuccessHandler<BaseResponse>.object, failure: @escaping RequestFailure)
    func getListFloor(success: @escaping SuccessHandler<FloorEntity>.array, failure: @escaping RequestFailure)
    func getListRoomClass(success: @escaping SuccessHandler<RoomTypeEntity>.array, failure: @escaping RequestFailure)
    func getRoomForEdit(roomID: Int, success: @escaping SuccessHandler<EditRoomParam>.object, failure: @escaping RequestFailure)
}

class RoomManagementAPIService: RoomManagementAPIServiceProtocol {
    
    func getRoomForEdit(roomID: Int, success: @escaping SuccessHandler<EditRoomParam>.object, failure: @escaping RequestFailure) {
        let endPoint = RoomManagementEndPoint.getRoomForEdit(roomID: roomID)
        network.requestData(endPoint: endPoint, success: MapperData.mapObject(success), failure: failure)
    }
    
    func getListFloor(success: @escaping SuccessHandler<FloorEntity>.array, failure: @escaping RequestFailure) {
        let endPoint = RoomManagementEndPoint.getListFloor
        network.requestData(endPoint: endPoint, success: MapperData.mapArray(success), failure: failure)
    }
    
    func getListRoomClass(success: @escaping SuccessHandler<RoomTypeEntity>.array, failure: @escaping RequestFailure) {
        let endPoint = RoomManagementEndPoint.getListRoomClass
        network.requestData(endPoint: endPoint, success: MapperData.mapArray(success), failure: failure)
    }
    
    func deleteFloor(id: Int, success: @escaping SuccessHandler<BaseResponse>.object, failure: @escaping RequestFailure) {
        let endPoint = RoomManagementEndPoint.deleteFloor(id: id)
        network.requestData(endPoint: endPoint, success: MapperData.mapObject(success), failure: failure)
    }
    
    func insertOrUpdateFloor(param: InsertOrUpdateFloorParam, success: @escaping SuccessHandler<BaseResponse>.object, failure: @escaping RequestFailure) {
        let endPoint = RoomManagementEndPoint.insertOrUpdateFloor(param: param)
        network.requestData(endPoint: endPoint, success: MapperData.mapObject(success), failure: failure)
    }
    
    func editRoom(param: EditRoomParam, success: @escaping SuccessHandler<BaseResponse>.object, failure: @escaping RequestFailure) {
        let endPoint = RoomManagementEndPoint.editRoom(param: param)
        network.requestData(endPoint: endPoint, success: MapperData.mapObject(success), failure: failure)
    }
    
    func deleteRoom(id: Int, success: @escaping SuccessHandler<BaseResponse>.object, failure: @escaping RequestFailure) {
        let endPoint = RoomManagementEndPoint.deleteRoom(id: id)
        network.requestData(endPoint: endPoint, success: MapperData.mapObject(success), failure: failure)
    }
    
    
    func getFloorWithRoom(token: String, success: @escaping SuccessHandler<FloorEntity>.array, failure: @escaping RequestFailure) {
        let endPoint = RoomManagementEndPoint.getFloorWithRoom(token: token)
        network.requestData(endPoint: endPoint, success: MapperData.mapArray(success), failure: failure)
    }

    private let network: APINetworkProtocol
    
    init(network: APINetworkProtocol) {
        self.network = network
    }
}
