//
//  AddRateSettingProtocols.swift
//  Bizkasa
//
//  Created Tien Dinh on 10/25/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//
//  Template generated by Tien Dinh

import Foundation

//MARK: Wireframe -
protocol AddRateSettingWireframeProtocol: class {

}
//MARK: Presenter -
protocol AddRateSettingPresenterProtocol: class {

    var interactor: AddRateSettingInteractorInputProtocol? { get set }
}

//MARK: Interactor -
protocol AddRateSettingInteractorOutputProtocol: class {

    /* Interactor -> Presenter */
}

protocol AddRateSettingInteractorInputProtocol: class {

    var presenter: AddRateSettingInteractorOutputProtocol?  { get set }

    /* Presenter -> Interactor */
}

//MARK: View -
protocol AddRateSettingViewProtocol: class {

    var presenter: AddRateSettingPresenterProtocol?  { get set }

    /* Presenter -> ViewController */
}