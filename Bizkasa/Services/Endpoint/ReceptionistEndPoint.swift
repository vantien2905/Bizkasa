//
//  ReceptionistEndPoint.swift
//  Bizkasa
//
//  Created by DINH VAN TIEN on 3/14/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//

import Foundation
import Alamofire



enum ReceptionistEndPoint {
    case getListCustomerCheckIn
    case getInvoices(param: GetInvoiceParam)
    case getRoomsByClass
    case getConfigPrice(roomId: Int)
    case getWidget(type: Int)
    case getOrderForCheckOut(orderId: Int, mode: Int)
    case addOrderDetail(param: SubFeeDetailEntity)
    case deleteOrderDetail(param: SubFeeDetailEntity)
    case updateOrder(param: OrderInfoEntity)
    case addOrder(param: CheckInParam)
    case changCalculatorMode(orderID: Int, mode: Int, hotelID: Int)
    case addCustomer(param: AddCustomerParam)
    case changeStatusRoom(roomID: Int, status: String)
    case insertOrUpdateInvoice(param: InsertInvoiceParam)
   
}

extension ReceptionistEndPoint: EndPointType {
    var path: String {
        switch self {
        case .getListCustomerCheckIn:
            return "api/Customer/GetListCustomerCheckIn"
        case .getInvoices:
            return "/api/Invoice/GetInvoices"
        case .getRoomsByClass:
            return "/api/Room/GetRoomsByClass"
        case .getConfigPrice:
            return "api/Room/GetConfigPriceBy"
        case .getWidget(let type):
            return "/api/Widget/GetWidget?WidgetType=\(type)"
        case .getOrderForCheckOut:
            return "/api/Order/GetOrderForCheckOut"
        case .addOrderDetail:
            return "/api/Order/AddOrderDetail"
        case .deleteOrderDetail:
            return "/api/Order/DeleteOrderDetail"
        case .updateOrder:
            return "/api/Order/UpdateOrder"
        case .addOrder:
            return "/api/Order/AddOrder"
        case .changCalculatorMode:
            return "/api/Order/ChangCalculatorMode"
        case .addCustomer:
            return "api/customer/AddCustomer"
        case .changeStatusRoom:
            return "api/Room/ChangeStatusRoom"
        case .insertOrUpdateInvoice:
            return "/api/invoice/InsertOrUpdateInvoice"
        }
    }

    var httpMethod: HTTPMethod {
        switch self {
        case .getRoomsByClass, .getWidget:
            return .get
        default:
            return .post
        }
    }

    var parameters: JSONDictionary {
        switch self {
        case .getListCustomerCheckIn, .getRoomsByClass, .getWidget:
            return [:]
        case .getInvoices(let param):
            return param.toJSON()
        case .getConfigPrice(let roomId):
            return ["roomid": roomId]
        case .getOrderForCheckOut(let orderId, let mode):
            return ["orderId": orderId, "mode": mode]
        case .addOrderDetail(let param):
            return param.toJSON()
        case .deleteOrderDetail(let param):
            return param.toJSON()
        case .updateOrder(let param):
            return param.toJSON()
        case .addOrder(let param):
            return param.toJSON()
        case .changCalculatorMode(orderID: let orderID, mode: let mode, let hotelID):
            return ["orderId": orderID,
                    "mode": mode,
                    "HotelId": hotelID]
        case .addCustomer(let param):
            return param.toJSON()
        case .changeStatusRoom(roomID: let roomID, status: let status):
            return ["roomId": roomID, "status": status]
        case .insertOrUpdateInvoice(param: let param):
            return param.toJSON()
        }
    }

    var headers: HTTPHeaders? {
        return DefaultHeader().addAuthHeader()
    }
}
