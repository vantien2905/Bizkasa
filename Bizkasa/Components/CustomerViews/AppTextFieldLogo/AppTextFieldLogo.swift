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
    @IBOutlet weak var vTitle: AppTitleLogo!
    @IBOutlet weak var tfContent: UITextField!
    @IBOutlet weak var vBottomLine: UIView!
    @IBOutlet weak var heightTitle: NSLayoutConstraint!
    
    var textFieldCallBack: ((_ value: String) -> Void)?
    
    override func draw(_ rect: CGRect) {
        tfContent.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
    }

    override func setUpViews() {
        tfContent.delegate = self
        tfContent.tintColor = AppColor.line
    }

    func setHeightTitle(value: CGFloat) {
        heightTitle.constant = value
    }

    func getText() -> String {
        return tfContent.text&
    }

    func setText(_ text: String) {
        tfContent.text = text
    }
    
    func setTitleAndLogo(_ image: UIImage, title: String, isSecurity: Bool = false) {
        vTitle.setTitleAndLogo(image, title: title)
        tfContent.isSecureTextEntry = isSecurity
    }
    
    func hideTitle(){
        vTitle.isHidden = true
    }
    
    @objc func textFieldChanged(){
        self.textFieldCallBack?(tfContent.text&)
    }
    
    func setPlaceHolder(title:String){
        tfContent.placeholder = title&
    }
    
    func setPlaceHolderColor(color:UIColor){
        tfContent.setPlaceHolderTextColor(color)
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
