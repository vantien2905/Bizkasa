//
//  CheckInProtocols.swift
//  Bizkasa
//
//  Created DINH VAN TIEN on 2/29/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//
//  Template generated by Tien Dinh

import Foundation

//MARK: Wireframe -
protocol CheckInWireframeProtocol: class {

}
//MARK: Presenter -
protocol CheckInPresenterProtocol: class {

    var interactor: CheckInInteractorInputProtocol? { get set }

    func getConfigPrice(roomId: Int)
}

//MARK: Interactor -
protocol CheckInInteractorOutputProtocol: class {

    /* Interactor -> Presenter */
    func didGetConfigPrice(result: [ConfigPriceEntity]?, error: APIError?)
}

protocol CheckInInteractorInputProtocol: class {

    var presenter: CheckInInteractorOutputProtocol?  { get set }

    /* Presenter -> Interactor */
    func getConfigPrice(roomId: Int)
}

//MARK: View -
protocol CheckInViewProtocol: class {

    var presenter: CheckInPresenterProtocol?  { get set }

    /* Presenter -> ViewController */
    func didGetConfigPrice(result: [ConfigPriceEntity]?, error: APIError?)
}