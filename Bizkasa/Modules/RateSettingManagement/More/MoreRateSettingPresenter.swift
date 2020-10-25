//
//  MoreRateSettingPresenter.swift
//  Bizkasa
//
//  Created Tien Dinh on 10/24/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//
//  Template generated by Tien Dinh
//

import UIKit

class MoreRateSettingPresenter: MoreRateSettingPresenterProtocol {

    weak private var view: MoreRateSettingViewProtocol?
    var interactor: MoreRateSettingInteractorInputProtocol?
    private let router: MoreRateSettingWireframeProtocol

    init(interface: MoreRateSettingViewProtocol, interactor: MoreRateSettingInteractorInputProtocol?, router: MoreRateSettingWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }

}

extension MoreRateSettingPresenter: MoreRateSettingInteractorOutputProtocol {
	
}