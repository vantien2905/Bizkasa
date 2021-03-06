//
//  DetailRateSettingPresenter.swift
//  Bizkasa
//
//  Created Tien Dinh on 10/11/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//
//  Template generated by Tien Dinh
//

import UIKit

class DetailRateSettingPresenter: DetailRateSettingPresenterProtocol {

    weak private var view: DetailRateSettingViewProtocol?
    var interactor: DetailRateSettingInteractorInputProtocol?
    private let router: DetailRateSettingWireframeProtocol

    init(interface: DetailRateSettingViewProtocol,
         interactor: DetailRateSettingInteractorInputProtocol?,
         router: DetailRateSettingWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }

}

extension DetailRateSettingPresenter: DetailRateSettingInteractorOutputProtocol {
	
}
