//
//  SignUpViewController.swift
//  Bizkasa
//
//  Created DINH VAN TIEN on 4/30/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//
//  Template generated by Tien Dinh
//

import UIKit

class SignUpViewController: BaseViewController {

    @IBOutlet weak var vUser        : AppTextFieldLogo!
    @IBOutlet weak var vPassword    : AppTextFieldLogo!
    @IBOutlet weak var vHotelName   : AppTextFieldLogo!
    @IBOutlet weak var vPhone       : AppTextFieldLogo!
    @IBOutlet weak var vAddress     : AppTextFieldLogo!
    @IBOutlet weak var btnSignUp    : UIButton!

	var presenter: SignUpPresenterProtocol?

	override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func setUpViews() {
        vUser.setTitleAndLogo(AppImage.imgUser, title: "Email")
        vUser.setPlaceHolder(title: "Nhập email")
        vPassword.setTitleAndLogo(AppImage.imgPassword,
                                  title: "Mật khẩu",
                                  isSecurity: true)
        vPassword.setPlaceHolder(title: "Nhập mật khẩu")
        vHotelName.setTitleAndLogo(AppImage.imgHotel, title: "Tên khách sạn")
        vHotelName.setPlaceHolder(title: "Nhập tên khách sạn")
        vPhone.setTitleAndLogo(AppImage.imgPhone, title: "Số điện thoại")
        vPhone.setPlaceHolder(title: "Nhập số điện thoại")
        vAddress.setTitleAndLogo(AppImage.imgAddress, title: "Địa chỉ")
        vAddress.setPlaceHolder(title: "Nhập địa chỉ")
    }

    override func viewDidLayoutSubviews() {
        btnSignUp.setShadow()
    }

    override func setUpNavigation() {
        setTitleNavigation(title: "Đăng nhập")
        addBackWhiteToNavigation()
    }

    private func validate() -> Bool {

        if vUser.getText().isEmpty {
            self.view.makeToast("Bạn chưa nhập email")
            return false
        }

        if !vUser.getText().isValidEmail() {
            self.view.makeToast("Không đúng định dạng email")
            return false
        }

        if vPassword.getText().isEmpty {
            self.view.makeToast("Bạn chưa nhập mật khẩu")
            return false
        }

        if vHotelName.getText().isEmpty {
            self.view.makeToast("Bạn chưa nhập tên khách sạn")
            return false
        }

        if vPhone.getText().isEmpty {
            self.view.makeToast("Bạn chưa nhập số điện thoại")
            return false
        }
        return true
    }

    @IBAction func btnSignUpTapped() {
        view.endEditing(true)
        if validate() {
            let param = RegisterParam()
            param.IsChecked = true

            let user = UserInfoParam()
            user.userName = vUser.getText()
            user.password = vPassword.getText()
            param.User = user

            self.presenter?.register(param: param)
        }
    }

    @IBAction func btnLoginTapped() {
        self.closePage()
    }

}

extension SignUpViewController: SignUpViewProtocol {
    func didRegister(result: UserEntity?, error: APIError?) {
        if let result = result {
            UserDefaultHelper.shared.saveUser(result)
            let param = CompleteRegisterParam()
            param.hotelId = result.HotelId
            param.Name = vHotelName.getText()
            param.Phone = vPhone.getText()
            param.Email = result.Email
            param.Address = vAddress.getText()
            presenter?.completedRegiser(param: param)
        } else {
            self.makeToast(message: error?.message?.first ?? "")
        }
    }

    func didCompletedRegiser(result: UserEntity?, error: APIError?) {
        if let result = result {
            UserDefaultHelper.shared.saveUser(result)
            let home = HomeRouter.createModule().convertNavi()
            let menu = LeftMenuRouter.createModule()
            let vc = SideMenuController(contentViewController: home,
                                        menuViewController: menu)
            self.view.window?.rootViewController = vc
        } else {
            self.makeToast(message: error?.message?.first ?? "")
        }
    }

	
}
