//
//  CheckInPresenter.swift
//  Bizkasa
//
//  Created DINH VAN TIEN on 2/29/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//
//  Template generated by Tien Dinh
//

import UIKit

class CheckInPresenter: CheckInPresenterProtocol {
    func addCustomer(param: AddCustomerParam) {
        interactor?.addCustomer(param: param)
    }

    func addOrder(param: CheckInParam) {
        interactor?.addOrder(param: param)
    }

    func getConfigPrice(roomId: Int) {
        interactor?.getConfigPrice(roomId: roomId)
    }


    weak private var view: CheckInViewProtocol?
    var interactor: CheckInInteractorInputProtocol?
    private let router: CheckInWireframeProtocol

    init(interface: CheckInViewProtocol, interactor: CheckInInteractorInputProtocol?, router: CheckInWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }

}

extension CheckInPresenter: CheckInInteractorOutputProtocol {
    func didAddCustomer(result: CustomerEntity?, error: APIError?) {
        view?.didAddCustomer(result: result, error: error)
    }

    func didAddOrder(result: BaseResponse?, error: APIError?) {
        view?.didAddOrder(result: result, error: error)
    }

    func didGetConfigPrice(result: [ConfigPriceEntity]?, error: APIError?) {
        view?.didGetConfigPrice(result: result, error: error)
    }

	
}
