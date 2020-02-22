//
//  LeftMenuViewController.swift
//  CodeBase
//
//  Created DINH VAN TIEN on 2/12/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//
//  Template generated by Tien Dinh
//

import UIKit

class LeftMenuViewController: UIViewController {

	var presenter: LeftMenuPresenterProtocol?

	override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func btnLogoutTapped() {
        let vc = LoginRouter.createModule().convertNavi()
        self.view.window?.rootViewController = vc
    }
}

extension LeftMenuViewController: LeftMenuViewProtocol {
	
}
