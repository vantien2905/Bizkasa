//
//  EditGeneralRateSettingRouter.swift
//  Bizkasa
//
//  Created Tien Dinh on 11/1/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//
//  Template generated by Tien Dinh
//

import UIKit

class EditGeneralRateSettingRouter: EditGeneralRateSettingWireframeProtocol {

    weak var viewController: UIViewController?

    static func createModule(rateSetting: RateSettingEntity?) -> EditGeneralRateSettingViewController {
        // Change to get view from storyboard if not using progammatic UI
        let view = EditGeneralRateSettingViewController.initFromNib()
        let interactor = EditGeneralRateSettingInteractor()
        let router = EditGeneralRateSettingRouter()
        let presenter = EditGeneralRateSettingPresenter(interface: view, interactor: interactor, router: router)

        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        view.rateSetting = rateSetting
        
        return view
    }
}
