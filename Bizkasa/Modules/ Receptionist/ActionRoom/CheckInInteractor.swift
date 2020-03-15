//
//  CheckInInteractor.swift
//  Bizkasa
//
//  Created DINH VAN TIEN on 2/29/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//
//  Template generated by Tien Dinh
//

import UIKit

class CheckInInteractor: CheckInInteractorInputProtocol {
    let service = Provider.shared.receptionistAPIService

    func getConfigPrice(roomId: Int) {
        service.getConfigPrice(roomId: roomId, success: { (result) in
            self.presenter?.didGetConfigPrice(result: result, error: nil)
        }) { (error) in
            self.presenter?.didGetConfigPrice(result: nil, error: error)
        }
    }


    weak var presenter: CheckInInteractorOutputProtocol?
}
