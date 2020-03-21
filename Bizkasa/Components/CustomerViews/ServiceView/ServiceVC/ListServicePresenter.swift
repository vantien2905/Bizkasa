//
//  ListServicePresenter.swift
//  Bizkasa
//
//  Created DINH VAN TIEN on 3/21/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//
//  Template generated by Tien Dinh
//

import UIKit

class ListServicePresenter: ListServicePresenterProtocol {
    func getWidget() {
        interactor?.getWidget()
    }


    weak private var view: ListServiceViewProtocol?
    var interactor: ListServiceInteractorInputProtocol?
    private let router: ListServiceWireframeProtocol

    init(interface: ListServiceViewProtocol, interactor: ListServiceInteractorInputProtocol?, router: ListServiceWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }

}

extension ListServicePresenter: ListServiceInteractorOutputProtocol {
    func didGetWidget(result: [WidgetTypeEntity]?, error: APIError?) {
        view?.didGetWidget(result: result, error: error)
    }

	
}
