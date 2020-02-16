//
//  UIView+Container.swift
//  Vebrary
//
//  Created by DINH VAN TIEN on 5/6/19.
//  Copyright © 2019 DINH VAN TIEN. All rights reserved.
//

//import UIKit
//
//extension UIView {
//    var parentViewController: UIViewController? {
//        var parentResponder: UIResponder? = self
//        while parentResponder != nil {
//            // swiftlint:disable:next force_unwrapping
//            parentResponder = parentResponder!.next
//            if let viewController = parentResponder as? UIViewController {
//                return viewController
//            }
//        }
//        return nil
//    }
//
//    var parentNavigationController: UINavigationController? {
//        let currentViewController = parentViewController
//        if let navigationController = currentViewController as? UINavigationController {
//            return navigationController
//        }
//        return currentViewController?.navigationController
//    }
//}

