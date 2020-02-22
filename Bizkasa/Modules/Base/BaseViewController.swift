//
//  BaseViewController.swift
//  Vebrary
//
//  Created by DINH VAN TIEN on 5/6/19.
//  Copyright © 2019 DINH VAN TIEN. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

enum StyleNavigation {
    case left
    case right
}

enum MainVisible {
    case home
    case moduleContainer
}

class BaseViewController: UIViewController {
    
    let mainBackgroundColor = UIColor.white
    let mainNavigationBarColor = AppColor.main
    //    let SlideInPresentationManager.shared = SlideInPresentationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigation()
        setUpViews()
        //        setDefaultNavi()
        setColorNavigation()
    }
    
    let lbNoData: UILabel = {
        let lb = UILabel()
        lb.text = "KHÔNG CÓ DỮ LIỆU !"
        lb.font = .muliRegular15
        lb.font = UIFont.boldSystemFont(ofSize: lb.font.pointSize)
        lb.textColor = .black
        
        return lb
    }()
    
    deinit {
        print("Remove NotificationCenter Deinit")
        NotificationCenter.default.removeObserver(self)
    }
    
    let btnNavi : UIButton = UIButton()
    
    func setUpViews() {
        if CommonHelper.isIpad() {
            SlideInPresentationManager.shared.direction = .center
            SlideInPresentationManager.shared.sizePercent = 4/5
            //            SlideInPresentationManager.shared.direction = .center
            //            SlideInPresentationManager.shared.sizePercent = 4/5
        }
    }
    
    func setColorNavigation() {
        self.navigationBar?.barTintColor = AppColor.main
        self.navigationBar?.tintColor = AppColor.main
        self.navigationBar?.shadowImage = UIImage()
        self.navigationBar?.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationBar?.isTranslucent = false
        self.navigationBar?.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.muliSemiBold22]
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    func setUpNavigation() {
        
    }
    
    func addShadowNavigation() {
        self.navigationController?.navigationBar.layer.shadowColor = UIColor.gray.cgColor
        self.navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        self.navigationController?.navigationBar.layer.shadowRadius = 4.0
        self.navigationController?.navigationBar.layer.shadowOpacity = 1.0
        self.navigationController?.navigationBar.layer.masksToBounds = false
    }
    
    func setDefaultNavi() {
        addButtonImageToNavigation(image: AppImage.imgMenu, style: .left, action: #selector(goBack))
    }
    
    @objc func goBack() {
        self.sideMenuController?.revealMenu()
    }
    
    func showNavigation() {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    func hideNavigation() {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func startLoading() {
        self.view.startLoading()
    }
    
    func stopLoading() {
        self.view.stopLoading()
    }
    
    func showAlert(title: String?, message:String?, accept: @escaping ()->Void) {
        self.view.isUserInteractionEnabled = true
        let alert = UIAlertController(title: title ?? "THÔNG BÁO", message: message, preferredStyle: .alert)
        let actionOK = UIAlertAction(title: "Đồng ý", style: .cancel) { (_) in
            accept()
        }
        let actionCancel = UIAlertAction(title: "Hủy", style: .default, handler: nil)
        alert.addAction(actionOK)
        alert.addAction(actionCancel)
        UIApplication.topViewController()?.present(controller: alert)
    }
    
    func checkVCInMain(isVC: MainVisible) -> Bool {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return false}
        switch isVC {
        case .home:
            if let sideVC = appDelegate.window?.rootViewController as? SideMenuController {
                if let _ = sideVC.contentViewController.children.first as? HomeViewController {
                    return true
                }
            }
            return false
        case .moduleContainer:
            return true
        }
    }
    
    func setHomeToMain() {
        let vc = HomeRouter.createModule().convertNavi()
        sideMenuController?.setContentViewController(to: vc)
    }
}

// MARK: Add button left, right, title
extension BaseViewController {
    
    public func addRightButtonNavigationBar(titles: [String], actions: [Selector]) {
        var rightButtons: [UIBarButtonItem] = [UIBarButtonItem]()
        for (index, title) in titles.enumerated() {
            let btnApprove = UIButton(type: .custom)
            btnApprove.setTitle(title, for: .normal)
            btnApprove.contentEdgeInsets = UIEdgeInsets(top: 5.0, left: 5.0, bottom: 5.0, right: 5.0)
            btnApprove.tintColor = AppColor.whiteColor
            if actions.count > index {
                btnApprove.addTarget(self, action: actions[index], for: .touchUpInside)
            }
            btnApprove.backgroundColor = AppColor.secondMain
            btnApprove.cornerRadius = 5.0
            let approveRightButton: UIBarButtonItem = UIBarButtonItem(customView: btnApprove)
            rightButtons.append(approveRightButton)
        }
        self.addRightButtonNavigationBar(buttons: rightButtons)
    }
    
    public func addRightButtonNavigationBar(buttons: [UIBarButtonItem]?) {
        if buttons == nil || (buttons?.isEmpty)! {
            return
        }
        self.navigationItem.rightBarButtonItems = buttons
    }
    
    func createBarButton(image: UIImage,
                         action: Selector?,
                         imageInset: UIEdgeInsets = UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0)) -> UIBarButtonItem {
        let button = UIButton(type: .custom)
        button.tintColor = AppColor.lightWhite
        button.setImage(image.filled(withColor: .white), for: .normal)
        button.showsTouchWhenHighlighted = true
        button.frame = CGRect(x: 0, y: 0, width: 30, height: 44)
        button.imageEdgeInsets = imageInset
        if let action = action {
            button.addTarget(self, action: action, for: .touchUpInside)
        }
        return UIBarButtonItem(customView: button)
    }
    
    func addButtonToNavigation(image: UIImage,
                               style: StyleNavigation,
                               action: Selector?) {
        let btn = UIButton()
        btn.setImage(image, for: .normal)
        if let _action = action {
            btn.addTarget(self, action: _action, for: .touchUpInside)
        }
        
        btn.frame = CGRect(x: 0, y: 0, width: 60, height: 44)
        
        let button = UIBarButtonItem(customView: btn)
        if style == .left {
            btn.contentHorizontalAlignment = .left
            self.navigationItem.leftBarButtonItem = button
        } else {
            self.navigationItem.rightBarButtonItem = button
            btn.contentHorizontalAlignment = .right
        }
    }
    
    func setTitleImageNavigation(image: UIImage) {
        let view = UIView()
        let imageView = UIImageView(image:image)
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
        imageView.anchor(view.topAnchor, left: view.leftAnchor,
                         bottom: view.bottomAnchor, right: view.rightAnchor,
                         topConstant: 0, leftConstant: 0,
                         bottomConstant: 9, rightConstant: 0,
                         widthConstant: 0, heightConstant: 0)
        self.navigationItem.titleView = view
    }
    
    func addTwoButtonToNavigation(image1: UIImage,
                                  action1: Selector?,
                                  image2: UIImage,
                                  action2: Selector?) {
        let btn1 = UIButton()
        btn1.setImage(image1, for: .normal)
        if let _action = action1 {
            btn1.addTarget(self, action: _action, for: .touchUpInside)
        }
        
        btn1.frame = CGRect(x: 0, y: 0, width: 30, height: 44)
        btn1.contentHorizontalAlignment = .right
        let button1 = UIBarButtonItem(customView: btn1)
        
        //---
        let btn2 = UIButton()
        btn2.setImage(image2, for: .normal)
        if let _action = action2 {
            btn2.addTarget(self, action: _action, for: .touchUpInside)
        }
        btn2.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        btn2.contentHorizontalAlignment = .right
        
        let button2 = UIBarButtonItem(customView: btn2)
        
        self.navigationItem.rightBarButtonItems = [button1, button2]
    }
    
    func addTwoButtonTextToNavigation(text1: String,
                                      action1: Selector?,
                                      text2: String,
                                      action2: Selector?,
                                      textColor:UIColor = .white) {
        let btn1 = UIButton()
        
        if let _action = action1 {
            btn1.addTarget(self, action: _action, for: .touchUpInside)
        }
        
        btn1.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        btn1.contentHorizontalAlignment = .right
        btn1.setTitle(text1, for: .normal)
        btn1.setTitleColor(textColor, for: .normal)
        btn1.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        btn1.backgroundColor = AppColor.secondMain
        btn1.contentEdgeInsets =  UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        btn1.setBorder(cornerRadius: 10)
        btn1.clipsToBounds = true
        let button1 = UIBarButtonItem(customView: btn1)
        
        //---
        let btn2 = UIButton()
        
        if let _action = action2 {
            btn2.addTarget(self, action: _action, for: .touchUpInside)
        }
        btn2.frame = CGRect(x: 0, y: 0, width: 44, height: 40)
        btn2.contentHorizontalAlignment = .right
        btn2.setTitle(text2, for: .normal)
        btn2.setTitleColor(textColor, for: .normal)
        btn2.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        btn2.backgroundColor = AppColor.secondMain
        btn2.contentEdgeInsets =  UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        btn2.setBorder(cornerRadius: 10)
        btn2.clipsToBounds = true
        
        let button2 = UIBarButtonItem(customView: btn2)
        
        self.navigationItem.rightBarButtonItems = [button1, button2]
    }
    
    func addListButtonToNavigation(actions: [TaskEnum],
                                   action: Selector?,
                                   textColor: UIColor = .white) {
        
        var listButton:[UIBarButtonItem] = []
        
        for i in (0..<actions.count).reversed() {
            
            let item = actions[i]
            
            let btn = UIButton()
            
            btn.contentHorizontalAlignment = .right
            btn.setTitleColor(textColor, for: .normal)
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 17)
            btn.titleLabel?.textAlignment = .center
            btn.titleLabel?.lineBreakMode = .byWordWrapping
            btn.titleLabel?.numberOfLines = 0
            btn.contentEdgeInsets =  UIEdgeInsets(top: 5, left: 8, bottom: 5, right: 8)
            btn.setBorder(cornerRadius: 10)
            btn.clipsToBounds = true
            
            if let _action = action {
                btn.addTarget(self, action: _action, for: .touchUpInside)
            }
            
            if i < 2 {
                btn.setTitle(text: item.name&)
                btn.backgroundColor = AppColor.secondMain
                let button = UIBarButtonItem(customView: btn)
                listButton.append(button)
            } else {
                
                if i < 3 {
                    if i == 2 {
                        btn.setImage(AppImage.imgSearchMore, for: .normal)
                        btn.tag = AppConstant.more_tag
                    } else {
                        for j in (0..<3).reversed() {
                            btn.backgroundColor = AppColor.secondMain
                            btn.setTitle(text: actions[j].name&)
                        }
                    }
                    
                    let button = UIBarButtonItem(customView: btn)
                    listButton.append(button)
                }
            }
        }
        
        self.navigationItem.rightBarButtonItems = listButton
    }
    
    
    func addButtonTextToNavigation(title: String,
                                   style: StyleNavigation,
                                   action: Selector?,
                                   textColor: UIColor = UIColor.white) {
        
        var _title = title
        if style == .right {
            _title = title
        }
        btnNavi.frame = CGRect(x: 0, y: 0, width: _title.widthOfString(usingFont: .muliRegular17) + 20, height: 44)
        btnNavi.setTitle(_title, for: .normal)
        btnNavi.setTitleColor(textColor, for: .normal)
        btnNavi.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        btnNavi.backgroundColor = AppColor.secondMain
        btnNavi.contentEdgeInsets =  UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        btnNavi.setBorder(cornerRadius: 10)
        btnNavi.clipsToBounds = true
        
        if let _action = action {
            btnNavi.addTarget(self, action: _action, for: .touchUpInside)
        }
        btnNavi.sizeToFit()
        
        let button = UIBarButtonItem(customView: btnNavi)
        if style == .left {
            self.navigationItem.leftBarButtonItem = button
        } else {
            self.navigationItem.rightBarButtonItem = button
        }
    }
    
    func addTwoButtonToLeftNavigation(image1: UIImage,
                                      action1: Selector?,
                                      image2: UIImage,
                                      action2: Selector?) {
        let btn1 = UIButton()
        btn1.setImage(image1, for: .normal)
        btn1.tintColor = .white
        if let _action = action1 {
            btn1.addTarget(self, action: _action, for: .touchUpInside)
        }
        
        btn1.frame = CGRect(x: 0, y: 0, width: 30, height: 44)
        btn1.contentHorizontalAlignment = .right
        let button1 = UIBarButtonItem(customView: btn1)
        
        //---
        let btn2 = UIButton()
        btn2.setImage(image2, for: .normal)
        btn2.tintColor = .white
        if let _action = action2 {
            btn2.addTarget(self, action: _action, for: .touchUpInside)
        }
        btn2.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        btn2.contentHorizontalAlignment = .right
        
        let button2 = UIBarButtonItem(customView: btn2)
        
        self.navigationItem.leftBarButtonItems = [button1, button2]
    }
    
    func setTitleNavigation(title: String,
                            textColor: UIColor = UIColor.white,
                            action: Selector? = nil ) {
        let lb = UILabel()
        lb.font = CommonHelper.isIpad() ? .muliBold25 : .muliBold19
        lb.text             = title
        lb.textAlignment    = .center
        lb.numberOfLines    = 2
        lb.textColor        = textColor
        lb.sizeToFit()
        
        //        let tap = UITapGestureRecognizer(target: self, action: action)
        //        lb.addGestureRecognizer(tap)
        let vTest = UIView()
        vTest.frame = CGRect(x: 0, y: 0, width: 200, height: 44)
        vTest.addSubview(lb)
        lb.centerSuperview()
        self.navigationItem.titleView = vTest
    }
    
    func closePage() {
        if let navigationController = navigationController, navigationController.viewControllers.first != self {
            navigationController.popViewController(animated: true)
        } else {
            dismiss(animated: true, completion: nil)
        }
    }
    
    func addButtonImageToNavigation(image: UIImage,
                                    style: StyleNavigation,
                                    action: Selector?) {
        let btn = UIButton()
        btn.setImage(image, for: .normal)
        if let _action = action {
            btn.addTarget(self, action: _action, for: .touchUpInside)
        }
        btn.frame = CGRect(x: 0, y: 0, width: 60, height: 44)
        btn.imageView?.contentMode = .scaleAspectFit
        let button = UIBarButtonItem(customView: btn)
        if style == .left {
            btn.imageEdgeInsets = UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 20)
            btn.contentHorizontalAlignment = .left
            self.navigationItem.leftBarButtonItem = button
        } else {
            btn.imageEdgeInsets = UIEdgeInsets(top: 5, left: 20, bottom: 5, right: 0)
            self.navigationItem.rightBarButtonItem = button
            btn.contentHorizontalAlignment = .right
            self.navigationItem.rightBarButtonItem = button
        }
    }
}
extension BaseViewController {
    func addBackWhiteToNavigation() {
        addButtonImageToNavigation(image: AppImage.imgBack,
                                   style: .left,
                                   action: #selector(btnBackTapped))
    }
    
    func addBackWhiteAndTitleToNavigation(title:String, textColor:UIColor = .white) {
        let btn1 = UIButton()
        btn1.setImage(AppImage.imgBack, for: .normal)
        btn1.tintColor = .white
        btn1.addTarget(self, action: #selector(btnBackTapped), for: .touchUpInside)
        
        btn1.frame = CGRect(x: 0, y: 0, width: 30, height: 44)
        btn1.contentHorizontalAlignment = .right
        let button1 = UIBarButtonItem(customView: btn1)
        
        //---
        let btn2 = UIButton()
        btn2.setTitle(text: title)
        btn2.tintColor = .white
        btn2.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        btn2.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        btn2.contentHorizontalAlignment = .right
        
        let button2 = UIBarButtonItem(customView: btn2)
        
        self.navigationItem.leftBarButtonItems = [button1, button2]
        
    }
    
    @objc func btnBackTapped() {
        if let navigationController = navigationController, navigationController.viewControllers.first != self {
            navigationController.popViewController(animated: true)
        } else {
            dismiss(animated: true, completion: nil)
        }
    }
}
