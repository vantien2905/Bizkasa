//
//  ListReceiptRouter.swift
//  Bizkasa
//
//  Created DINH VAN TIEN on 2/26/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//
//  Template generated by Tien Dinh
//

import UIKit

class ListReceiptRouter: ListReceiptWireframeProtocol {

    weak var viewController: UIViewController?

    static func createModule() -> ListReceiptViewController {
        // Change to get view from storyboard if not using progammatic UI
        let view = ListReceiptViewController.initFromNib()
        let interactor = ListReceiptInteractor()
        let router = ListReceiptRouter()
        let presenter = ListReceiptPresenter(interface: view, interactor: interactor, router: router)

        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view

        return view
    }
}
