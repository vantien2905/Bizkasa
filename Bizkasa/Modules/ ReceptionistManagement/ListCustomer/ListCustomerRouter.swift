//
//  ListCustomerRouter.swift
//  Bizkasa
//
//  Created DINH VAN TIEN on 2/26/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//
//  Template generated by Tien Dinh
//

import UIKit

class ListCustomerRouter: ListCustomerWireframeProtocol {

    weak var viewController: UIViewController?

    static func createModule() -> ListCustomerViewController {
        // Change to get view from storyboard if not using progammatic UI
        let view = ListCustomerViewController.initFromNib()
        let interactor = ListCustomerInteractor()
        let router = ListCustomerRouter()
        let presenter = ListCustomerPresenter(interface: view, interactor: interactor, router: router)

        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view

        return view
    }
}
