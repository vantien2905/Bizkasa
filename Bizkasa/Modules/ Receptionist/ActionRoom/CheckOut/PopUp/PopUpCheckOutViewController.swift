//
//  PopUpCheckOutViewController.swift
//  Bizkasa
//
//  Created by DINH VAN TIEN on 4/4/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//

import UIKit

protocol PopUpCheckOutViewControllerDelegate: class {
    func btnAcceptTapped(content: String, price: Int, indexPath: IndexPath)
}

class PopUpCheckOutViewController: BaseViewController {

    @IBOutlet weak var vContent: AppTextViewLogo!
    @IBOutlet weak var vCharge: AppTextFieldLogo!
    @IBOutlet weak var btnAccept: UIButton!

    weak var delegate: PopUpCheckOutViewControllerDelegate?

    var indexPath: IndexPath!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.definesPresentationContext = true
        self.view.backgroundColor = AppColor.normalBlack.withAlphaComponent(0.3)

    }

    override func setUpViews() {
        vContent.setTitleAndLogo(AppImage.imgNote, title: "Nội dung")
        vContent.setPlaceholder("Nhập nội dung")
        vCharge.setTitleAndLogo(AppImage.imgPrice, title: "Số tiền")
        vCharge.setPlaceHolder(title: "Nhập số tiền")
        vCharge.tfContent.keyboardType = .numberPad
    }

    @IBAction func btnCloseTapped() {
        self.dismiss(animated: false)
    }

    @IBAction func btnAcceptTapped() {
        if validate() {
            let content = vContent.getText()&
            if let price = Int(vCharge.getText()) {
                delegate?.btnAcceptTapped(content: content, price: price, indexPath: indexPath)
                self.dismiss(animated: false)
            }
        }
    }

    func validate() -> Bool {
        if vContent.getText()&.isEmpty {
            self.makeToast(message: "Bạn chưa nhập nội dung")
            return false
        }

        if vCharge.getText().isEmpty {
            self.makeToast(message: "Bạn chưa nhập số tiền")
            return false
        }

        return true
    }

}
