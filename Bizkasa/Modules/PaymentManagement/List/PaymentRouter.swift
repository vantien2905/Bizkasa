//
//  PaymentRouter.swift
//  Bizkasa
//
//  Created Tien Dinh on 7/7/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//
//  Template generated by Tien Dinh
//

import UIKit

class PaymentRouter: PaymentWireframeProtocol {

    weak var viewController: UIViewController?

    static func createModule() -> UIViewController {
        // Change to get view from storyboard if not using progammatic UI
        let view = PaymentViewController(nibName: nil, bundle: nil)
        let interactor = PaymentInteractor()
        let router = PaymentRouter()
        let presenter = PaymentPresenter(interface: view, interactor: interactor, router: router)

        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view

        return view
    }
}
