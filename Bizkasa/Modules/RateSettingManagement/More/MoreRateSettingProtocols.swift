//
//  MoreRateSettingProtocols.swift
//  Bizkasa
//
//  Created Tien Dinh on 10/24/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//
//  Template generated by Tien Dinh

import Foundation

//MARK: Wireframe -
protocol MoreRateSettingWireframeProtocol: class {

}
//MARK: Presenter -
protocol MoreRateSettingPresenterProtocol: class {

    var interactor: MoreRateSettingInteractorInputProtocol? { get set }
}

//MARK: Interactor -
protocol MoreRateSettingInteractorOutputProtocol: class {

    /* Interactor -> Presenter */
}

protocol MoreRateSettingInteractorInputProtocol: class {

    var presenter: MoreRateSettingInteractorOutputProtocol?  { get set }

    /* Presenter -> Interactor */
}

//MARK: View -
protocol MoreRateSettingViewProtocol: class {

    var presenter: MoreRateSettingPresenterProtocol?  { get set }

    /* Presenter -> ViewController */
}
