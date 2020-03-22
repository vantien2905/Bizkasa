//
//  TextFieldCalendar.swift
//  Bizkasa
//
//  Created by DINH VAN TIEN on 3/7/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//

import Foundation
import UIKit

class TextFieldCalendar: BaseViewXib {

    @IBOutlet weak var vTitle: AppTitleLogo!
    @IBOutlet weak var tfContent: UITextField!
    @IBOutlet weak var vBottomLine: UIView!
    @IBOutlet weak var heightTitle: NSLayoutConstraint!

    var textFieldCallBack: ((_ value: String) -> Void)?

    //    var fromTime = DateHelper.getDateTimeISO(), toTime = DateHelper.getNextDateTimeISO()

    var dateTime = DateHelper.getDateTimeISO()

    override func draw(_ rect: CGRect) {
        tfContent.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
    }

    override func setUpViews() {
        tfContent.delegate = self
        tfContent.tintColor = AppColor.line
        tfContent.text = DateHelper.getDateTime(input: dateTime)
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

    @IBAction func btnCalendarTapped() {

        let vc = DateTimePickerViewController.createModule(dateTime: dateTime, delegate: self)
        UIApplication.topViewController()?.present(controller: vc)
    }
}

extension TextFieldCalendar: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        vBottomLine.backgroundColor = AppColor.line
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        vBottomLine.backgroundColor = UIColor.gray
    }
}

extension TextFieldCalendar : DateTimePickerViewControllerDelegate {
    func getDateTimeSelected(dateTime: String) {
        self.dateTime = dateTime
        self.tfContent.text = DateHelper.getDateTime(input: dateTime)
        //
        //        lbDate.text = DateHelper.getShortDateTime(input: dateTime)
        //        lbTime.text = DateHelper.getTime(input: dateTime)
        //        getDateTime?(dateTime)
    }
}