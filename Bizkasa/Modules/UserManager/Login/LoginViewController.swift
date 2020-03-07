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
        vUser.setTitleAndLogo(AppImage.imgUser, title: "Email")
        vUser.setPlaceHolder(title: "Nhập email")
        vPassword.setTitleAndLogo(AppImage.imgPassword, title: "Mật khầu", isSecurity: true)
        vPassword.setPlaceHolder(title: "Nhập mật khẩu")
        vUser.setText("haichay88@gmail.com")
        vPassword.setText("123456")
    }

    override func viewDidLayoutSubviews() {
        btnFaceBook.setShadow()
        btnGoogle.setShadow()
        btnZalo.setShadow()
        btnLogin.setShadow()
    }

    override func setUpNavigation() {
        setTitleNavigation(title: "Đăng nhập")
    }

    private func validate() -> Bool {
        if !vUser.getText().isValidEmail() {
            self.view.makeToast("Không đúng định dạng email")
            return false
        }
        return true
    }

    @IBAction func btnLoginTapped() {
        if validate() {
            presenter?.login(userName: vUser.getText(), password: vPassword.getText().md5())
        }
    }
}

extension LoginViewController: LoginViewProtocol {
    func didLogin(result: UserEntity?, error: APIError?) {

        if let result = result {
            print(result)
            UserDefaultHelper.shared.saveUser(result)
            let home = HomeRouter.createModule().convertNavi()
            let menu = LeftMenuRouter.createModule()
            let vc = SideMenuController(contentViewController: home, menuViewController: menu)
            self.view.window?.rootViewController = vc
        } else {
            self.view.makeToast(error?.message?.first)
        }
    }
}
