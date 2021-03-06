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
    func addCustomer(param: AddCustomerParam) {
        service.addCustomer(param: param, success: { (result) in
            self.presenter?.didAddCustomer(result: result, error: nil)
        }) { (error) in
            self.presenter?.didAddCustomer(result: nil, error: error)
        }
    }

    func addOrder(param: CheckInParam) {
        service.addOrder(param: param, success: { (result) in
            self.presenter?.didAddOrder(result: result, error: nil)
        }) { (error) in
            self.presenter?.didAddOrder(result: nil, error: error)
        }
    }

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
