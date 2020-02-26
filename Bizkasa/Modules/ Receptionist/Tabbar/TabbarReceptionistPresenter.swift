//
//  TabbarReceptionistPresenter.swift
//  Bizkasa
//
//  Created DINH VAN TIEN on 2/26/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//
//  Template generated by Tien Dinh
//

import UIKit

class TabbarReceptionistPresenter: TabbarReceptionistPresenterProtocol {

    weak private var view: TabbarReceptionistViewProtocol?
    var interactor: TabbarReceptionistInteractorInputProtocol?
    private let router: TabbarReceptionistWireframeProtocol

    init(interface: TabbarReceptionistViewProtocol, interactor: TabbarReceptionistInteractorInputProtocol?, router: TabbarReceptionistWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }

}

extension TabbarReceptionistPresenter: TabbarReceptionistInteractorOutputProtocol {
	
}