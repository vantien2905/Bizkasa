//
//  InsertPopUpRouter.swift
//  Bizkasa
//
//  Created Tien Dinh on 7/27/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//
//  Template generated by Tien Dinh
//

import UIKit

class InsertPopUpRouter: InsertPopUpWireframeProtocol {

    weak var viewController: UIViewController?

    static func createModule(actionType: FloorAndRoomAction, indexPath: IndexPath?, room: RoomEntity?, floor: FloorEntity?) -> InsertPopUpViewController {
        // Change to get view from storyboard if not using progammatic UI
        let view = InsertPopUpViewController.initFromNib()
        let interactor = InsertPopUpInteractor()
        let router = InsertPopUpRouter()
        let presenter = InsertPopUpPresenter(interface: view, interactor: interactor, router: router)

        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        view.actionType = actionType
        view.indexPath = indexPath
        view.room = room
        view.floor = floor

        return view
    }
}