//
//  AppDelegate.swift
//  Bizkasa
//
//  Created by DINH VAN TIEN on 2/16/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        IQKeyboardManager.shared.enable = true

        self.window = UIWindow(frame: UIScreen.main.bounds)
        let flash = FlashRouter.createModule()
        UIApplication.shared.statusBarStyle = .lightContent
        //            let navigation = UINavigationController(rootViewController: home)
        window?.rootViewController = flash
        window?.makeKeyAndVisible()
        return true
    }

}

