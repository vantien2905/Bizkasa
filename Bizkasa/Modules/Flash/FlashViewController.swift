//
//  FlashViewController.swift
//  CodeBase
//
//  Created DINH VAN TIEN on 2/12/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//
//  Template generated by Tien Dinh
//

import UIKit

class FlashViewController: UIViewController {

	var presenter: FlashPresenterProtocol?

	override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
                if CommonHelper.isIpad() {
                    SideMenuController.preferences.basic.menuWidth = 400
                } else {
                    SideMenuController.preferences.basic.menuWidth = 300
                }
                CATransaction.begin()
                CATransaction.setCompletionBlock({
                    self.gotoLogin()
                })
                CATransaction.commit()
    }

    private func gotoHome() {
        let home = HomeRouter.createModule().convertNavi()
        let menu = LeftMenuRouter.createModule()
        let vc = SideMenuController(contentViewController: home, menuViewController: menu)
        self.view.window?.rootViewController = vc
    }

    private func gotoLogin() {
        let vc = LoginRouter.createModule().convertNavi()
        self.view.window?.rootViewController = vc
    }

}

extension FlashViewController: FlashViewProtocol {
	
}
