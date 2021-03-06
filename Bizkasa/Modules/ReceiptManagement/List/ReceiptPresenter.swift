//
//  ReceiptPresenter.swift
//  Bizkasa
//
//  Created Tien Dinh on 6/15/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//
//  Template generated by Tien Dinh
//

import UIKit

class ReceiptPresenter: ReceiptPresenterProtocol {
    
    func getInvoices(param: GetInvoiceParam) {
        interactor?.getInvoices(param: param)
    }

    weak private var view: ReceiptViewProtocol?
    var interactor: ReceiptInteractorInputProtocol?
    private let router: ReceiptWireframeProtocol

    init(interface: ReceiptViewProtocol, interactor: ReceiptInteractorInputProtocol?, router: ReceiptWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }

}

extension ReceiptPresenter: ReceiptInteractorOutputProtocol {
	func didGetInvoices(result: InvoiceResponse?, error: APIError?) {
        view?.didGetInvoices(result: result, error: error)
    }
}
