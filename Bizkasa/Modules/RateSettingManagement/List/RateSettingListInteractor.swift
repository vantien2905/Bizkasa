//
//  RateSettingListInteractor.swift
//  Bizkasa
//
//  Created Tien Dinh on 9/20/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//
//  Template generated by Tien Dinh
//

import UIKit

class RateSettingListInteractor: RateSettingListInteractorInputProtocol {
    func deleteRoomClass(listID: [Int]) {
        service.deleteRoomClass(listID: listID) { (result) in
            self.presenter?.didDeleteRoomClass(result: result, error: nil)
        } failure: { (error) in
            self.presenter?.didDeleteRoomClass(result: nil, error: error)
        }
    }
    
    func addRoomClass(param: RateSettingEntity) {
        service.addRoomClass(param: param) { (result) in
            self.presenter?.didGetRoomClass(result: result, error: nil)
        } failure: { (error) in
            self.presenter?.didGetRoomClass(result: nil, error: error)
        }

    }
    
    let service = Provider.shared.rateSettingAPIService
    
    func getRoomClass() {
        service.getRoomClass(success: { (result) in
            self.presenter?.didGetRoomClass(result: result, error: nil)
        }) { (error) in
            self.presenter?.didGetRoomClass(result: nil, error: error)
        }
    }

    weak var presenter: RateSettingListInteractorOutputProtocol?
}
