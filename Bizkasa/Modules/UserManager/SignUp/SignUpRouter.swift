//
//  SignUpRouter.swift
//  Bizkasa
//
//  Created DINH VAN TIEN on 4/30/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//
//  Template generated by Tien Dinh
//

import UIKit

class SignUpRouter: SignUpWireframeProtocol {

    weak var viewController: UIViewController?

    static func createModule() -> UIViewController {
        // Change to get view from storyboard if not using progammatic UI
        let view = SignUpViewController(nibName: nil, bundle: nil)
        let interactor = SignUpInteractor()
        let router = SignUpRouter()
        let presenter = SignUpPresenter(interface: view,
                                        interactor: interactor,
                                        router: router)

        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view

        return view
    }
}
