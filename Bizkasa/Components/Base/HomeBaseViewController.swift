//
//  HomeBaseViewController.swift
//  DXG E-Office
//
//  Created by DINH VAN TIEN on 12/3/19.
//  Copyright © 2019 DINH VAN TIEN. All rights reserved.
//

import Foundation
import UIKit

class HomeBaseViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        setUpDefaultNavigation()
    }

    func setUpDefaultNavigation() {
        addButtonToNavigation(image: AppImage.imgMenu, style: .left, action: #selector(btnMenuTapped))
    }

    func setUpView() {

    }

    @objc func btnMenuTapped() {
        self.sideMenuController?.revealMenu()
    }
}

