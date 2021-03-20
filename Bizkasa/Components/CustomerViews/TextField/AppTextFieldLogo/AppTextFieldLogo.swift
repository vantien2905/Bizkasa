//
//  AppTextFieldLogo.swift
//  DXG E-Office
//
//  Created by Macintosh HD on 12/17/19.
//  Copyright © 2019 DINH VAN TIEN. All rights reserved.
//

import Foundation
import UIKit

class AppTextFieldLogo: BaseViewXib {
    @IBOutlet weak var vTitle       : AppTitleLogo!
    @IBOutlet weak var tfContent    : UITextField!
    @IBOutlet weak var vBottomLine  : UIView!
    @IBOutlet weak var heightTitle  : NSLayoutConstraint!
    
    var textFieldCallBack: ((_ value: String) -> Void)?
    
    var formatNumber = false {
        didSet {
            if self.formatNumber {
                self.tfContent.keyboardType = .decimalPad
            }
        }
    }
    
    override func draw(_ rect: CGRect) {
        tfContent.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
    }

    override func setUpViews() {
        tfContent.delegate = self
        tfContent.tintColor = AppColor.line
        tfContent.clearButtonMode = .whileEditing
    }

    func setHeightTitle(value: CGFloat) {
        heightTitle.constant = value
    }

    func getText() -> String {
        return tfContent.text&
    }

    func setText(_ text: String?) {
        tfContent.text = formatNumber ? text&.currencyInputFormatting() : text?.removeCommaDecimal()
    }
    
    func setTitleAndLogo(_ image: UIImage,
                         title: String,
                         isSecurity: Bool = false,
                         placeholder: String? = nil) {
        vTitle.setTitleAndLogo(image, title: title)
        tfContent.isSecureTextEntry = isSecurity
        if placeholder&.isEmpty {
            tfContent.placeholder = "Nhập \(title.lowercased())"
        } else {
            tfContent.placeholder = formatNumber ? placeholder&.currencyInputFormatting() : placeholder
        }
    }
    
    func hideTitle(){
        vTitle.isHidden = true
    }
    
    @objc func textFieldChanged(){
        self.textFieldCallBack?(tfContent.text&.removeCommaDecimal())
        
        if formatNumber {
            if let amountString = tfContent.text?.currencyInputFormatting() {
                tfContent.text = amountString
            }
        }
    }
    
    func setPlaceHolder(title:String){
        tfContent.placeholder = title&
    }
    
    func setPlaceHolderColor(color:UIColor){
        tfContent.setPlaceHolderTextColor(color)
    }
    
    func setKeyboardNumber() {
        formatNumber = true
        tfContent.keyboardType = .numberPad
    }
    
    func setKeyboardDecimal() {
        formatNumber = true
        tfContent.keyboardType = .decimalPad
    }
}

extension AppTextFieldLogo: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        vBottomLine.backgroundColor = AppColor.line
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        vBottomLine.backgroundColor = UIColor.gray
    }
}
