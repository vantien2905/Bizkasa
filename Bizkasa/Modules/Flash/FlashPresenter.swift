//
//  FlashPresenter.swift
//  CodeBase
//
//  Created DINH VAN TIEN on 2/12/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//
//  Template generated by Tien Dinh
//

import UIKit

class FlashPresenter: FlashPresenterProtocol {

    weak private var view: FlashViewProtocol?
    var interactor: FlashInteractorInputProtocol?
    private let router: FlashWireframeProtocol

    init(interface: FlashViewProtocol,
         interactor: FlashInteractorInputProtocol?,
         router: FlashWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }

}

extension FlashPresenter: FlashInteractorOutputProtocol {
	
}
