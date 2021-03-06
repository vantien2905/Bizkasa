//
//  ReceiptRouter.swift
//  Bizkasa
//
//  Created Tien Dinh on 6/15/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//
//  Template generated by Tien Dinh
//

import UIKit

class ReceiptRouter: ReceiptWireframeProtocol {

    weak var viewController: UIViewController?

    static func createModule() -> UIViewController {
        // Change to get view from storyboard if not using progammatic UI
        let view = ReceiptViewController(nibName: nil, bundle: nil)
        let interactor = ReceiptInteractor()
        let router = ReceiptRouter()
        let presenter = ReceiptPresenter(interface: view, interactor: interactor, router: router)

        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view

        return view
    }
}
