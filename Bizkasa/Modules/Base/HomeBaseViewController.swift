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

    let btTitle: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = UIColor.clear
        button.setTitle("Trang Chủ".uppercased(), for: .normal)
        button.setTitleColor(AppColor.whiteColor, for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 225, height: 40)
        button.titleLabel?.font = .muliBold17
        button.titleLabel?.minimumScaleFactor = 0.7
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.showsTouchWhenHighlighted = true
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.lineBreakMode = .byWordWrapping
        return button
    }()

    let vTitleNaviMenu: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.isHidden = true
        view.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        return view
    }()

    let tbTitleNaviMenu: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.backgroundColor = AppColor.main
        return tableView
    }()

    let btnHideTitleNaviMenu: UIButton = {
        let btn = UIButton()
        btn.addTarget(self, action: #selector(btnHideTitleNaviMenuTapped), for: .touchUpInside)
        return btn
    }()

    var isLayoutViewMenu = true

    var heightTableMenuNavi: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        setUpDefaultNavigation()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //getListNotification()

    }

    func checkNewVersion() {

        CheckVersionHelper.shared.checkAppStore {[weak self] (isNeedUpdate, _) in
            if isNeedUpdate == true, let _ = self {
                let content = UNMutableNotificationContent()
                content.title = "Thông báo"
                content.body = "Đã có phiên bản mới. Bấm vào đây để cập"
                content.sound = UNNotificationSound.default

                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)

                let request = UNNotificationRequest(identifier: AppConstant.NOTIFICATION_UPDATE_APP, content: content, trigger: trigger)
                UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
            }
        }
    }

    func setTitleNaviHome(_ title: String?) {
        self.btTitle.setTitle(title&.trim().uppercased() + "  ▼", for: .normal)
        self.btTitle.sizeToFit()
    }

    func setUpDefaultNavigation() {
        addButtonToNavigation(image: AppImage.imgMenu, style: .left, action: #selector(btnMenuTapped))
        self.navigationItem.titleView = btTitle
        self.btTitle.sizeToFit()
        vTitleNaviMenu.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        //        btTitle.sizeToFit()
//        btTitle.addTarget(self, action: #selector(actionTitle), for: .touchUpInside)
    }

    func setUpView() {
        view.addSubview(vTitleNaviMenu)
        vTitleNaviMenu.fillSuperview()
        vTitleNaviMenu.addSubview(btnHideTitleNaviMenu)
        vTitleNaviMenu.addSubview(tbTitleNaviMenu)
        //        vMenu.layoutIfNeeded()
        btnHideTitleNaviMenu.fillSuperview()
        tbTitleNaviMenu.anchor(vTitleNaviMenu.topAnchor, left: vTitleNaviMenu.leftAnchor, right: vTitleNaviMenu.rightAnchor, topConstant: 0, leftConstant: 0, rightConstant: 0)
        heightTableMenuNavi = tbTitleNaviMenu.heightAnchor.constraint(equalToConstant: 1)
        heightTableMenuNavi.isActive = true

    }

    @objc func btnHideTitleNaviMenuTapped() {
        UIView.animate(withDuration: 0.2, animations: {
            self.heightTableMenuNavi.constant = 0
            self.view.layoutIfNeeded()
        }) { (_) in
            self.vTitleNaviMenu.isHidden = true
        }
    }

    @objc func actionTitle() {
        print("Action title")
        vTitleNaviMenu.isHidden = false

    }

    @objc func btnMenuTapped() {
        self.sideMenuController?.revealMenu()
    }

    @objc func btnQrCodeTapped() {
      
    }

}

