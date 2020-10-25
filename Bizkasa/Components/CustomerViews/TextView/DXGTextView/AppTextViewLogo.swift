//
//  DXGTextView.swift
//  DXG E-Office
//
//  Created by DINH VAN TIEN on 11/8/19.
//  Copyright © 2019 Lac Viet Corp. All rights reserved.
//

import Foundation
import UIKit

class AppTextViewLogo: BaseViewXib {
    @IBOutlet weak var vTitle: AppTitleLogo!
    @IBOutlet weak var vTextView: AppTextView!

    @IBOutlet var textViewHeightConstraint: NSLayoutConstraint!

    var isEditData = false {
        didSet {
            vTextView.textview.isUserInteractionEnabled = self.isEditData
        }
    }

    override func setUpViews() {
        super.setUpViews()
        self.textViewHeightConstraint.constant = self.vTextView.textview.contentSize.height
        vTextView.didChangeCallBack = {
            self.textViewHeightConstraint.constant = self.vTextView.textview.contentSize.height
        }
    }

    func getText() -> String? {
        return vTextView.textview.text
    }

    func setTitleAndLogo(_ image: UIImage = AppImage.imgPayment,
                         title: String,
                         placeHolder: String? = nil) {
        vTitle.setTitleAndLogo(image, title: title)
        if !placeHolder&.isEmpty {
            vTextView.TEXTVIEW_PLACE_HOLDER = placeHolder&
        } else {
            vTextView.TEXTVIEW_PLACE_HOLDER = "Nhập \(title.lowercased())"
        }
    }

    func setPlaceholder(_ placeholder: String) {
        vTextView.TEXTVIEW_PLACE_HOLDER = placeholder
    }

    func setContentTextView(_ content: String?) {
        if !content&.isEmpty {
            vTextView.textview.textColor = .black
            vTextView.textview.text = content
        }
    }
}
