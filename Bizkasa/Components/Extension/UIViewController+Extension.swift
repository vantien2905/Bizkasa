//
//  UIViewController+Extension.swift
//  Vebrary
//
//  Created by DINH VAN TIEN on 5/2/19.
//  Copyright © 2019 DINH VAN TIEN. All rights reserved.
//

import UIKit
import Toast_Swift

public extension UIViewController {

   /// SwifterSwift: Check if ViewController is onscreen and not hidden.
   var isVisible: Bool {
     // http://stackoverflow.com/questions/2777438/how-to-tell-if-uiviewcontrollers-view-is-visible
     return self.isViewLoaded && view.window != nil
   }

   /// SwifterSwift: NavigationBar in a ViewController.
   var navigationBar: UINavigationBar? {
     return navigationController?.navigationBar
   }

 }

extension UIViewController {

    static func initFromNib() -> Self {
        func instantiateFromNib<T: UIViewController>(_ : T.Type) -> T {
            return T(nibName: String(describing: T.self), bundle: nil)
        }

        return instantiateFromNib(self)
    }

    static func initFrom(storyboardName: String) -> Self {
        func instantiateFromStoryboard<T: UIViewController>(_ : T.Type) -> T {
            guard let vc = UIStoryboard(name: storyboardName,
                                        bundle: nil).instantiateViewController(withIdentifier: String(describing: T.self)) as? T else {
                                            return T.init()
                                            
            }
            return vc
        }

        return instantiateFromStoryboard(self)
    }
}

func enumCount<T: Hashable>(_: T.Type) -> Int {
    var i = 1
    while (withUnsafePointer(to: &i, {
        return $0.withMemoryRebound(to: T.self, capacity: 1, { return $0.pointee })
    }).hashValue != 0) {
        i += 1
    }
    return i
}

extension UIViewController {
    func push(controller: UIViewController, animated: Bool = true) {
        self.navigationController?.pushViewController(controller, animated: animated)
    }

    func pop(animated: Bool = true ) {
        self.navigationController?.popViewController(animated: animated)
    }

    func present(controller: UIViewController, animated: Bool = true) {
        self.present(controller, animated: animated, completion: nil)
    }
    
    func present(controller: UIViewController, animated: Bool = true, modal: UIModalPresentationStyle = .fullScreen) {
        controller.modalPresentationStyle = modal
        self.present(controller, animated: animated, completion: nil)
    }

    func dismiss(animated: Bool = true) {
        self.dismiss(animated: animated, completion: nil)
    }
}

extension UIViewController {
    func hideKeyboard() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
        if let nav = self.navigationController {
            nav.view.endEditing(true)
        }
    }
    
    func makeToast(message:String){
        if !message.isEmpty {
            self.view.makeToast(message)
        }
    }
}

extension UIViewController {
    func showPopupAlert(title: String?, message: String?, actionTitles:[String?], actions:[((UIAlertAction) -> Void)?]) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for (index, title) in actionTitles.enumerated() {
            if index == actionTitles.count - 1 {
                let action = UIAlertAction(title: title, style: .default, handler: actions[index])
                alert.addAction(action)
            } else {
                let action = UIAlertAction(title: title, style: .default, handler: actions[index])
                alert.addAction(action)
            }

        }
        self.present(alert, animated: true, completion: {
            alert.view.superview?.isUserInteractionEnabled = true
            alert.view.superview?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.dismissOnTapOutside)))
        })
    }

    @objc func dismissOnTapOutside(){
       self.dismiss(animated: true, completion: nil)
    }
}

extension UIViewController {
    func convertNavi() -> UINavigationController {
        return UINavigationController(rootViewController: self)
    }
}
extension UIViewController {
    func setDetailSplit(_ viewController: UIViewController) {
        splitViewController?.viewControllers[1] = viewController
    }

    func setNaviDetailSplit(_ viewController: UIViewController) {
        let nav = UINavigationController(rootViewController: viewController)
        splitViewController?.viewControllers[1] = nav
    }

    func presentPopUp(_ viewController: UIViewController) {
        let nav = UINavigationController(rootViewController: viewController)
        nav.modalPresentationStyle = .pageSheet
        self.present(controller: nav)
    }

    func presentPopUpNavi(_ naviViewController: UIViewController) {
        naviViewController.modalPresentationStyle = .pageSheet
        splitViewController?.present(controller: naviViewController)
    }

    func setMasterSplit(_ viewController: UIViewController) {

        splitViewController?.viewControllers[0] = viewController
    }

    func setNaviMasterSplit(_ viewController: UIViewController) {
        let nav = UINavigationController(rootViewController: viewController)
        splitViewController?.viewControllers[0] = nav
    }

    func hideBackButtonInIpad() {
        guard let navi = self.navigationController else { return }
        let viewControllers: [UIViewController] = navi.viewControllers as [UIViewController]
        print(viewControllers.count)
        if UtilsHelper.isIpad() && viewControllers.count < 2 {
            let backButton = UIBarButtonItem(title: "", style: .plain, target: navigationController, action: nil)
            navigationItem.leftBarButtonItem = backButton
        }
    }

    func isEnablePop() -> Bool {
        guard let navi = self.navigationController else { return false}
        let viewControllers: [UIViewController] = navi.viewControllers as [UIViewController]
        if viewControllers.count >= 2 {
            return true
        } else {
            return false
        }
    }
}
