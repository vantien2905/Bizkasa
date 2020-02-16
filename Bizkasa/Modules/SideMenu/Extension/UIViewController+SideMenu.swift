//
//  UIViewController+SideMenu.swift
//  Vebrary
//
//  Created by DINH VAN TIEN on 5/6/19.
//  Copyright © 2019 DINH VAN TIEN. All rights reserved.
//

import UIKit

// Provides access to the side menu controller
public extension UIViewController {

    /// Access the nearest ancestor view controller hierarchy that is a side menu controller.
    var sideMenuController: SideMenuController? {
        return findSideMenuController(from: self)
    }

    fileprivate func findSideMenuController(from viewController: UIViewController) -> SideMenuController? {
        var sourceViewController: UIViewController? = viewController
        repeat {
            sourceViewController = sourceViewController?.parent
            if let sideMenuController = sourceViewController as? SideMenuController {
                return sideMenuController
            }
        } while (sourceViewController != nil)
        return nil
    }
}
