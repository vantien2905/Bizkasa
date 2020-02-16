//
//  Segue.swift
//  Vebrary
//
//  Created by DINH VAN TIEN on 5/6/19.
//  Copyright © 2019 DINH VAN TIEN. All rights reserved.
//

import UIKit

/// Custom Segue that is required for SideMenuController to be used in Storyboard.
open class SideMenuSegue: UIStoryboardSegue {

    /// The type of segue
    ///
    /// - content: represent the content scene of side menu
    /// - menu: represent the menu scene of side menu
    public enum ContentType: String {
        case content = "SideMenu.Content"
        case menu = "SideMenu.Menu"
    }

    /// current content type
    public var contentType = ContentType.content

    /// Peforming the segue, will change the corresponding view controller of side menu to `destination` vew controller.
    /// This method is called when loading from storyboard.
    open override func perform() {
        guard let sideMenuController = source as? SideMenuController else {
            return
        }

        switch contentType {
        case .content:
            sideMenuController.contentViewController = destination
        case .menu:
            sideMenuController.menuViewController = destination
        }
    }

}

