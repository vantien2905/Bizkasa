//
//  CheckOutProtocols.swift
//  Bizkasa
//
//  Created DINH VAN TIEN on 3/21/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//
//  Template generated by Tien Dinh

import Foundation

//MARK: Wireframe -
protocol CheckOutWireframeProtocol: class {

}
//MARK: Presenter -
protocol CheckOutPresenterProtocol: class {

    var interactor: CheckOutInteractorInputProtocol? { get set }

    func getOrderForCheckOut(orderId: Int, mode: Int)
    func addOrderDetail(param: SubFeeDetailEntity)
    func deleteOrderDetail(param: SubFeeDetailEntity)
    func updateOrder(param: OrderInfoEntity)

    func changCalculatorMode(orderID: Int, mode: Int, hotelID: Int)

}

//MARK: Interactor -
protocol CheckOutInteractorOutputProtocol: class {

    /* Interactor -> Presenter */
    func didGetOrderForCheckOut(result: OrderInfoEntity?, error: APIError?)
    func didAddOrderDetail(result: BaseResponse?, error: APIError?)
    func didDeleteOrderDetail(result: BaseResponse?, error: APIError?)
    func didUpdateOrder(result: BaseResponse?, error: APIError?)
    func didChangCalculatorMode(result: OrderInfoEntity?, error: APIError?)
}

protocol CheckOutInteractorInputProtocol: class {

    var presenter: CheckOutInteractorOutputProtocol?  { get set }

    /* Presenter -> Interactor */
    func getOrderForCheckOut(orderId: Int, mode: Int)
    func addOrderDetail(param: SubFeeDetailEntity)
    func deleteOrderDetail(param: SubFeeDetailEntity)
    func updateOrder(param: OrderInfoEntity)

    func changCalculatorMode(orderID: Int, mode: Int, hotelID: Int)
}

//MARK: View -
protocol CheckOutViewProtocol: class {

    var presenter: CheckOutPresenterProtocol?  { get set }

    /* Presenter -> ViewController */
    func didGetOrderForCheckOut(result: OrderInfoEntity?, error: APIError?)
    func didAddOrderDetail(result: BaseResponse?, error: APIError?)
    func didDeleteOrderDetail(result: BaseResponse?, error: APIError?)
    func didUpdateOrder(result: BaseResponse?, error: APIError?)
    func didChangCalculatorMode(result: OrderInfoEntity?, error: APIError?)
}
