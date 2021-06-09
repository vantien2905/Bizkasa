//
//  AppTextView.swift
//  TaskManagement
//
//  Created by DINH VAN TIEN on 11/27/18.
//  Copyright © 2018 Thang Nguyen. All rights reserved.
//

import UIKit

class AppTextView: BaseView {
    
    let textview: UITextView = {
        let tv = UITextView()
        tv.font = UIFont.regular17
        return tv
    }()
    
    var TEXTVIEW_PLACE_HOLDER  = "Lý do" {
        didSet {
            textview.text = TEXTVIEW_PLACE_HOLDER
        }
    }
    
    var didChangeCallBack: (() -> Void)?
    
    override func setUpViews() {
        self.addSubview(textview)
        textview.fillSuperview()
        textview.delegate = self
        textview.layer.cornerRadius = 5
        textview.layer.borderColor = AppColor.normalGray.cgColor
        textview.layer.borderWidth = 1
        textview.text = TEXTVIEW_PLACE_HOLDER
        textview.textColor = UIColor.lightGray
        textview.tintColor = AppColor.dropdown
    }
}

extension AppTextView: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.textColor = AppColor.normalBlack
        if textView.text == TEXTVIEW_PLACE_HOLDER {
            textView.text = nil
        }
        textView.borderColor = AppColor.dropdown
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = TEXTVIEW_PLACE_HOLDER
            textView.textColor = UIColor.lightGray
            textView.borderColor = AppColor.normalGray
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        didChangeCallBack?()
    }
    
    func setPlaceHolder(_ text: String) {
        self.TEXTVIEW_PLACE_HOLDER = text
    }
    
    func getText() -> String {
        return textview.text
    }
    
    func checkIsEmpty() -> Bool {
        return textview.text.isEmpty || textview.text == TEXTVIEW_PLACE_HOLDER
    }
}
