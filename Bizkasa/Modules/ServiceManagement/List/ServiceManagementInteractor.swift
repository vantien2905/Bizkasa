//
//  ServiceManagementInteractor.swift
//  Bizkasa
//
//  Created Tien Dinh on 8/23/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//
//  Template generated by Tien Dinh
//

import UIKit

class ServiceManagementInteractor: ServiceManagementInteractorInputProtocol {
    
    let service = Provider.shared.serviceAPIService
    
    func deleteWedget(listID: [Int]) {
        service.deleteWedget(listID: listID, success: { (result) in
            self.presenter?.didDeleteWedget(result: result, error: nil)
        }) { (error) in
            self.presenter?.didDeleteWedget(result: nil, error: error)
        }
    }

    weak var presenter: ServiceManagementInteractorOutputProtocol?
    
    func getWidget(type: Int) {
        Provider.shared.receptionistAPIService.getWidget(type: type, success: { (result) in
            self.presenter?.didGetWidget(result: result, error: nil)
        }) { (error) in
            self.presenter?.didGetWidget(result: nil, error: error)
        }
    }
}
