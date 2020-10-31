//
//  RateSettingListProtocols.swift
//  Bizkasa
//
//  Created Tien Dinh on 9/20/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//
//  Template generated by Tien Dinh

import Foundation

//MARK: Wireframe -
protocol RateSettingListWireframeProtocol: class {

}
//MARK: Presenter -
protocol RateSettingListPresenterProtocol: class {

    var interactor: RateSettingListInteractorInputProtocol? { get set }
    
    func getRoomClass()
    func addRoomClass(param: RateSettingEntity)
    func deleteRoomClass(listID: [Int])
    func deleteConfigPrice(listID: [Int])
}

//MARK: Interactor -
protocol RateSettingListInteractorOutputProtocol: class {

    /* Interactor -> Presenter */
    func didGetRoomClass(result: [RateSettingEntity]?, error: APIError?)
    func didAddRoomClass(result: [RateSettingEntity]?, error: APIError?)
    func didDeleteRoomClass(result: BaseResponse?, error: APIError?)
    func didDeleteConfigPrice(result: BaseResponse?, error: APIError?)
}

protocol RateSettingListInteractorInputProtocol: class {

    var presenter: RateSettingListInteractorOutputProtocol?  { get set }

    /* Presenter -> Interactor */
    func getRoomClass()
    func addRoomClass(param: RateSettingEntity)
    func deleteRoomClass(listID: [Int])
    func deleteConfigPrice(listID: [Int])
}

//MARK: View -
protocol RateSettingListViewProtocol: class {

    var presenter: RateSettingListPresenterProtocol?  { get set }

    /* Presenter -> ViewController */
    func didGetRoomClass(result: [RateSettingEntity]?, error: APIError?)
    func didAddRoomClass(result: [RateSettingEntity]?, error: APIError?)
    func didDeleteRoomClass(result: BaseResponse?, error: APIError?)
    func didDeleteConfigPrice(result: BaseResponse?, error: APIError?)
}
