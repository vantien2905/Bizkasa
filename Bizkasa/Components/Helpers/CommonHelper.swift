//
//  UtilsHelper.swift
//  Vebrary
//
//  Created by DINH VAN TIEN on 5/14/19.
//  Copyright © 2019 DINH VAN TIEN. All rights reserved.
//

import UIKit
import Alamofire

class CommonHelper {

    static func isConnectedToInternet() -> Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }

    static func isIpad() -> Bool {
        if UIDevice().userInterfaceIdiom == .pad {
            return true
        } else {
            return false
        }
    }

    static func gotoHome() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let home = HomeRouter.createModule().convertNavi()
        let menu = LeftMenuRouter.createModule()
        let vc = SideMenuController(contentViewController: home, menuViewController: menu)
        appDelegate.window?.rootViewController = vc
    }

    static func gotoLogin() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let vc = LoginRouter.createModule()
        appDelegate.window?.rootViewController = vc
    }
}
