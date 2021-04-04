//
//  ListBottomButton.swift
//  Bizkasa
//
//  Created by Tien Dinh on 04/04/2021.
//  Copyright © 2021 DINH VAN TIEN. All rights reserved.
//

import Foundation
import UIKit

class ListBottomButton: BaseView {
    
    lazy var stackView = UIStackView().build {
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .fillEqually
        $0.spacing = 16
    }
    
    var listTitle: [String] = [] {
        didSet {
            setStackView()
        }
    }
    
    var listColor: [UIColor] = [.systemGreen, AppColor.main, .lightGray]
    
    var buttonActionCallback: ((_ title: String)->Void)?
    
    override func setUpViews() {
        addSubview(stackView)
        stackView.fillSuperViewWithMargin(10)
        stackView.snp.makeConstraints {
            $0.height.equalTo(40)
        }
        backgroundColor = AppColor.normalLightGray
    }
    
    private func setStackView() {
        for (index, item) in listTitle.enumerated() {
            let button = UIButton().build {
                $0.setTitle(item, for: .normal)
                $0.backgroundColor = AppColor.homeArrayColor[index]
                $0.layer.cornerRadius = 5
                $0.titleLabel?.numberOfLines = 0
                $0.titleLabel?.textAlignment = .center
                $0.sizeToFit()
                $0.titleLabel?.lineBreakMode = .byWordWrapping
                $0.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
                
            }
            
            stackView.addArrangedSubview(button)
        }
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
        buttonActionCallback?(sender.titleLabel?.text ?? "")
    }
}

