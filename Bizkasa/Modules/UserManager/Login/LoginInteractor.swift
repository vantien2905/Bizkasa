//
//  LoginInteractor.swift
//  Bizkasa
//
//  Created DINH VAN TIEN on 2/22/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//
//  Template generated by Tien Dinh
//

import UIKit

class LoginInteractor: LoginInteractorInputProtocol {
    func login(userName: String, password: String) {
        Provider.shared.userAPIService.login(userName: userName, password: password, success: {[weak self] (result) in
            guard let self = self else { return }
            self.presenter?.didLogin(result: result, error: nil)
        }) { (error) in
            self.presenter?.didLogin(result: nil, error: error)
        }
    }


    weak var presenter: LoginInteractorOutputProtocol?
}
