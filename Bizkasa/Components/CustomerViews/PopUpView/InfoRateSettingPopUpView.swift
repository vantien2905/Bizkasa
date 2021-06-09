//
//  DefaultPopUpView.swift
//  Bizkasa
//
//  Created by Tien Dinh on 10/25/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//

import Foundation
import UIKit
import Lottie

extension UIButton {
    public func setContent(title: String? = nil,
                           titleColor: UIColor? = nil,
                           font: UIFont? = nil,
                           image: UIImage? = nil,
                           backgroundColor: UIColor? = nil) {
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.titleLabel?.font = font
        self.setImage(image, for: .normal)
        self.backgroundColor = backgroundColor
    }
}

public class InfoRateSettingPopUpView: BasePopUpView {
    
    private lazy var titleLabel = UILabel().build {
        $0.textAlignment = .center
        $0.textColor = .gray
        $0.font = .systemFont(ofSize: 26, weight: .bold)
        $0.numberOfLines = 0
        $0.text = "Thông tin chung"
    }
    
    private lazy var roomTypeTextField = AppTextViewLogo().build {
        $0.setTitleAndLogo(title: "Loại phòng")
        $0.snp.makeConstraints {
            $0.height.equalTo(70)
        }
    }
    
    private lazy var bedTotalTextField = AppTextViewLogo().build {
        $0.setTitleAndLogo(title: "Số giường")
        $0.vTextView.textview.keyboardType = .numberPad
        $0.snp.makeConstraints {
            $0.height.equalTo(70)
        }
        
    }
    
    private lazy var customerTotalTextField = AppTextViewLogo().build {
        $0.setTitleAndLogo(title: "Số người")
        $0.vTextView.textview.keyboardType = .numberPad
        $0.snp.makeConstraints {
            $0.height.equalTo(70)
        }
    }
    
    private lazy var acceptButton = UIButton().build {
        $0.addTarget(self,
                     action: #selector(btnAcceptTapped),
                     for: .touchUpInside)
        $0.setContent(title: "Đồng ý",
                      titleColor: .white,
                      font: UIFont.systemFont(ofSize: 18, weight: .bold),
                      backgroundColor: AppColor.main)
    }
    
    private lazy var stackView = UIStackView().build {
        $0.alignment = .fill
        $0.distribution = .fill
        $0.spacing = 16
        $0.axis = .vertical
    }
    
    private lazy var cancelButton = UIButton().build {
        $0.setContent(title: "Huỷ",
                      titleColor: .gray,
                      font: UIFont.systemFont(ofSize: 18, weight: .bold),
                      backgroundColor: .lightGray)
        $0.addTarget(self,
                     action: #selector(btnCancelTapped),
                     for: .touchUpInside)
    }
    
    var hideWhenActionTapped = true
    
    var rateSetting: RateSettingEntity? {
        didSet {
            setData()
        }
    }
    
    public override func setUpViews() {
        super.setUpViews()
        
        stackView.addArrangedSubview(roomTypeTextField)
        stackView.addArrangedSubview(bedTotalTextField)
        stackView.addArrangedSubview(customerTotalTextField)
        stackView.addArrangedSubview(acceptButton)
        stackView.addArrangedSubview(cancelButton)
        
        vContent.addSubviews([titleLabel,
                              stackView])
        
        titleLabel.snp.makeConstraints {
            $0.leading.top.trailing.equalToSuperview().inset(16)
        }
        
        stackView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
            $0.bottom.equalToSuperview().inset(40)
        }
        
        acceptButton.snp.makeConstraints {
            $0.height.equalTo(48)
        }
        
        cancelButton.snp.makeConstraints {
            $0.height.equalTo(acceptButton)
        }
    }
    
    func setData() {
        guard let data = rateSetting else { return }
        if let room = data.RoomClass {
            roomTypeTextField.setContentTextView(room.Name)
            bedTotalTextField.setContentTextView("\(room.NumBed*)")
            customerTotalTextField.setContentTextView("\(room.NumCustomer*)")
        }
    }
    
    func getData() -> RateSettingEntity? {
        rateSetting?.RoomClass?.Name = roomTypeTextField.getText()&
        rateSetting?.RoomClass?.NumBed = Int(bedTotalTextField.getText()&)*
        rateSetting?.RoomClass?.NumCustomer = Int(customerTotalTextField.getText()&)*
        return rateSetting
    }
    
    @objc func btnAcceptTapped() {
        completionYes?()
        if hideWhenActionTapped {
            hidePopUp()
        }
    }
    
    @objc func btnCancelTapped() {
        completionNo?()
        if hideWhenActionTapped {
            hidePopUp()
        }
    }
    
    public func showPopUp(title: String,
                          hideWhenAction: Bool = true,
                          hideWhenOverTapped: Bool = true,
                          type: BasePopUpViewType = BasePopUpViewType.fromBottom,
                          accept completeYes: CompletionClosure? = nil,
                          cancel completeNo: CompletionClosure? = nil) {
        self.hideWhenActionTapped = hideWhenAction
        self.titleLabel.text = title
        btnOver.isEnabled = hideWhenOverTapped
        
        super.showPopUp(type: type,
                        accept: completeYes,
                        cancel: completeNo)
    }
}
