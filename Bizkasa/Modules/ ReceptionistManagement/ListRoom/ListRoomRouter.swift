//
//  ListRoomRouter.swift
//  Bizkasa
//
//  Created DINH VAN TIEN on 2/23/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//
//  Template generated by Tien Dinh
//

import UIKit

class ListRoomRouter: ListRoomWireframeProtocol {

    weak var viewController: UIViewController?

    static func createModule() -> UIViewController {
        // Change to get view from storyboard if not using progammatic UI
        let view = ListRoomViewController(nibName: nil, bundle: nil)
        let interactor = ListRoomInteractor()
        let router = ListRoomRouter()
        let presenter = ListRoomPresenter(interface: view, interactor: interactor, router: router)

        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view

        return view
    }
}