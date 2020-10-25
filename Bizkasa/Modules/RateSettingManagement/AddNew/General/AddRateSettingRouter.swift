//
//  AddRateSettingRouter.swift
//  Bizkasa
//
//  Created Tien Dinh on 10/25/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//
//  Template generated by Tien Dinh
//

import UIKit

class AddRateSettingRouter: AddRateSettingWireframeProtocol {

    weak var viewController: UIViewController?

    static func createModule() -> UIViewController {
        // Change to get view from storyboard if not using progammatic UI
        let view = AddRateSettingViewController(nibName: nil, bundle: nil)
        let interactor = AddRateSettingInteractor()
        let router = AddRateSettingRouter()
        let presenter = AddRateSettingPresenter(interface: view, interactor: interactor, router: router)

        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view

        return view
    }
}