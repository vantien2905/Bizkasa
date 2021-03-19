//
//  EditServicePresenter.swift
//  Bizkasa
//
//  Created Tien Dinh on 19/03/2021.
//  Copyright © 2021 DINH VAN TIEN. All rights reserved.
//
//  Template generated by Tien Dinh
//

import UIKit

class EditServicePresenter: EditServicePresenterProtocol {
    func addWidget(param: WidgetEntity) {
        interactor?.addWidget(param: param)
    }
    

    weak private var view: EditServiceViewProtocol?
    var interactor: EditServiceInteractorInputProtocol?
    private let router: EditServiceWireframeProtocol

    init(interface: EditServiceViewProtocol, interactor: EditServiceInteractorInputProtocol?, router: EditServiceWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }

}

extension EditServicePresenter: EditServiceInteractorOutputProtocol {
    func didAddWidget(result: [WidgetTypeEntity]?, error: APIError?) {
        view?.didAddWidget(result: result, error: error)
    }
    
	
}