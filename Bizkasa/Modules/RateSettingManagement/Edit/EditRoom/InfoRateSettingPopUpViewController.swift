//
//  InfoRateSettingViewController.swift
//  Bizkasa
//
//  Created by Tien Dinh on 10/25/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//

import UIKit

class InfoRateSettingPopUpViewController: UIViewController {
    
    private lazy var titleLabel = UILabel().build {
        $0.textAlignment = .center
        $0.textColor = .gray
        $0.font = .systemFont(ofSize: 26, weight: .bold)
        $0.numberOfLines = 0
        $0.text = "Thông tin chung"
    }
    
    private lazy var roomTypeTextField = AppTextViewLogo().build {
        $0.setTitleAndLogo(AppImage.imgRoom, title: "Loại phòng")
        $0.snp.makeConstraints {
            $0.height.equalTo(70)
        }
    }
    
    private lazy var bedTotalTextField = AppTextViewLogo().build {
        $0.setTitleAndLogo(AppImage.coupleRoom, title: "Số giường")
        $0.vTextView.textview.keyboardType = .numberPad
        $0.snp.makeConstraints {
            $0.height.equalTo(70)
        }
        
    }
    
    private lazy var customerTotalTextField = AppTextViewLogo().build {
        $0.setTitleAndLogo(AppImage.imgUser, title: "Số người")
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
    
    private lazy var closeButton = UIButton().build {
        $0.addTarget(self,
                     action: #selector(btnCancelTapped),
                     for: .touchUpInside)
    }
    
    open lazy var vContent = UIView().build {
        $0.backgroundColor = UIColor.white
    }
    
    var hideWhenActionTapped = true
    
    open var completionNo: CompletionClosure?
    open var completionYes: CompletionClosure?
    
    var rateSetting: RateSettingEntity? {
        didSet {
            setData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.definesPresentationContext = true
        self.view.backgroundColor = AppColor.normalBlack.withAlphaComponent(0.3)
        setUpViews()
    }
   
    func setUpViews() {
        view.addSubview(closeButton)
        closeButton.fillSuperview()
        view.addSubview(vContent)
        
        vContent.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().offset(0)
        }
        
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
            self.dismiss()
        }
    }
    
    @objc func btnCancelTapped() {
        completionNo?()
        if hideWhenActionTapped {
            self.dismiss()
        }
    }
}
