//
//  LoginViewController.swift
//  Bizkasa
//
//  Created DINH VAN TIEN on 2/22/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//
//  Template generated by Tien Dinh
//

import UIKit
import CryptoSwift

class LoginViewController: BaseViewController {

    @IBOutlet weak var vUser: AppTextFieldLogo!
    @IBOutlet weak var vPassword: AppTextFieldLogo!
    @IBOutlet weak var btnFaceBook: UIButton!
    @IBOutlet weak var btnGoogle: UIButton!
    @IBOutlet weak var btnZalo: UIButton!
    @IBOutlet weak var btnLogin: UIButton!


    var presenter: LoginPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func setUpViews() {
        vUser.setTitleAndLogo(AppImage.imgUser, title: "Tên đăng nhập")
        vUser.setPlaceHolder(title: "Nhập tên đăng nhập")
        vPassword.setTitleAndLogo(AppImage.imgPassword, title: "Mật khẩu", isSecurity: true)
        vPassword.setPlaceHolder(title: "Nhập mật khẩu")
    }

    override func viewDidLayoutSubviews() {
        btnFaceBook.setShadow()
        btnGoogle.setShadow()
        btnZalo.setShadow()
        btnLogin.setShadow()
    }

    override func setUpNavigation() {
        setTitleNavigation(title: "Đăng nhập")
        navigationController?.navigationBar.barTintColor = AppColor.main
    }

    private func validate() -> Bool {
        if vUser.getText().isEmpty {
            self.view.makeToast("Bạn chưa nhập tên đăng nhập")
            return false
        }

        if vPassword.getText().isEmpty {
            self.view.makeToast("Bạn chưa nhập mật khẩu")
            return false
        }
        return true
    }

    @IBAction func btnLoginTapped() {
        view.endEditing(true)
        if validate() {
            presenter?.login(userName: vUser.getText(),
                             password: vPassword.getText().md5())
        }
    }

    @IBAction func btnSignUpTapped() {
        let vc = SignUpRouter.createModule()
        self.push(controller: vc)
    }
}

extension LoginViewController: LoginViewProtocol {
    func didLogin(result: UserEntity?, error: APIError?) {

        if let result = result {
            print(result)
            UserDefaultHelper.shared.saveUser(result)
            let home = HomeRouter.createModule().convertNavi()
            let menu = LeftMenuRouter.createModule()
            let vc = SideMenuController(contentViewController: home,
                                        menuViewController: menu)
            self.view.window?.rootViewController = vc
        } else {
            self.view.makeToast(error?.message?.first)
        }
    }
}
