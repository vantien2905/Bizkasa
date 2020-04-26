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
    func btnAcceptServiceTapped(widget: WidgetEntity, total: Int)
}

class PopUpCheckOutViewController: BaseViewController {

    @IBOutlet weak var vContent: AppTextViewLogo!
    @IBOutlet weak var vCharge: AppTextFieldLogo!
    @IBOutlet weak var btnAccept: UIButton!

    @IBOutlet weak var vService: ServiceViewSingle!

    weak var delegate: PopUpCheckOutViewControllerDelegate?

    var indexPath: IndexPath!

    var isService = false

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

        vService.isHidden = !isService
        vContent.isHidden = isService
        vCharge.isHidden = isService
        btnAccept.isHidden = isService
        
//        vCharge.tfContent.delegate = self
        vCharge.tfContent.addTarget(self, action: #selector(myTextFieldDidChange), for: .editingChanged)

        vService.addNewCallBack = { widget, total in
            self.delegate?.btnAcceptServiceTapped(widget: widget, total: total)
            self.dismiss(animated: false)
        }

    }

    @objc func myTextFieldDidChange(_ textField: UITextField) {
        if let amountString = vCharge.tfContent.text?.currencyInputFormatting() {
            vCharge.tfContent.text = amountString
        }
    }

    @IBAction func btnCloseTapped() {
        self.dismiss(animated: false)
    }

    @IBAction func btnAcceptTapped() {
        if validate() {
            let content = vContent.getText()&
            if let price = Int(vCharge.getText().replacingOccurrences(of: ",", with: "")) {
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

 extension String {

     // formatting text for currency textField
     func currencyInputFormatting() -> String {

         var number: NSNumber!
         let formatter = NumberFormatter()
         formatter.numberStyle = .currencyAccounting
         formatter.currencySymbol = "$"
         formatter.maximumFractionDigits = 0
         formatter.minimumFractionDigits = 0

         var amountWithPrefix = self

         // remove from String: "$", ".", ","
         let regex = try! NSRegularExpression(pattern: "[^0-9]", options: .caseInsensitive)
         amountWithPrefix = regex.stringByReplacingMatches(in: amountWithPrefix, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, self.count), withTemplate: "")

         let double = (amountWithPrefix as NSString).doubleValue
         number = NSNumber(value: (double))

         // if first number is 0 or all numbers were deleted
         guard number != 0 as NSNumber else {
             return ""
         }

        return String(formatter.string(from: number)!.dropFirst())
     }
 }
