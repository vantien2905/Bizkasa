//
//  TabbarReceptionistViewController.swift
//  Bizkasa
//
//  Created DINH VAN TIEN on 2/26/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//
//  Template generated by Tien Dinh
//

import UIKit
import BATabBarController

class TabbarReceptionistViewController: UITabBarController {

	var presenter: TabbarReceptionistPresenterProtocol?
    
	override func viewDidLoad() {
        super.viewDidLoad()

        let listRoom = ListRoomRouter.createModule().convertNavi()
        let iconRoom = UITabBarItem(title: "Phòng", image: AppImage.imgRoom, selectedImage: AppImage.imgRoom)
        listRoom.tabBarItem = iconRoom

        let listCustomer = ListCustomerRouter.createModule().convertNavi()
               let iconCustomer = UITabBarItem(title: "Khách", image: AppImage.imgUser, selectedImage: AppImage.imgUser)
               listCustomer.tabBarItem = iconCustomer

        let listReceipt = ListReceiptRouter.createModule().convertNavi()
               let iconReceipt = UITabBarItem(title: "Phiếu thu", image: AppImage.imgPayment, selectedImage: AppImage.imgPayment)
               listReceipt.tabBarItem = iconReceipt
        let controllers = [listRoom, listReceipt, listCustomer]  //array of the root view controllers displayed by the tab bar interface
        self.viewControllers = controllers
        
        
        
//        let vc1 = ListRoomRouter.createModule()
//        vc1.menuTapped = { [weak self] in
//            self?.sideMenuController?.revealMenu()
//        }
//
//        let nav1 = vc1.convertNavi()
//
//        let vc2 = ListReceiptRouter.createModule()
//        vc2.menuTapped = { [weak self] in
//            self?.sideMenuController?.revealMenu()
//        }
//        let nav2 = vc2.convertNavi()
//
//        let vc3 = ListCustomerRouter.createModule()
//        vc3.menuTapped = { [weak self] in
//            self?.sideMenuController?.revealMenu()
//        }
//        let nav3 = vc3.convertNavi()
//
//        let option1 = NSMutableAttributedString(string: "Phòng")
//        option1.addAttribute(.foregroundColor, value: UIColor.gray, range: NSRange(location: 0, length: option1.length))
//
//        let option2 = NSMutableAttributedString(string: "Phiếu thu")
//        option2.addAttribute(.foregroundColor, value: UIColor.gray, range: NSRange(location: 0, length: option2.length))
//
//        let option3 = NSMutableAttributedString(string: "Khách")
//        option3.addAttribute(.foregroundColor, value: UIColor.gray, range: NSRange(location: 0, length: option3.length))
//
//        let tabBarItem  = BATabBarItem(image: AppImage.imgRoom.filled(withColor: .gray), selectedImage: AppImage.imgRoom.filled(withColor: .systemBlue), title: option1)
//        let tabBarItem2 = BATabBarItem(image: AppImage.imgPayment.filled(withColor: .gray), selectedImage: AppImage.imgPayment.filled(withColor: .systemBlue),title: option2)
//        let tabBarItem3 = BATabBarItem(image: AppImage.imgUser.filled(withColor: .gray), selectedImage: AppImage.imgUser.filled(withColor: .systemBlue), title: option3)
//
//
//        let baTabBarController = BATabBarController()
//        baTabBarController.viewControllers = [nav1, nav2, nav3]
//        baTabBarController.tabBarItems = [tabBarItem, tabBarItem2, tabBarItem3]
//
//        baTabBarController.delegate = self
//        baTabBarController.tabBarBackgroundColor = AppColor.normalLightGray
//        baTabBarController.tabBarItemStrokeColor = .systemBlue
//        baTabBarController.view.layoutIfNeeded()
//
//        self.view.addSubview(baTabBarController.view)
    }
}

extension TabbarReceptionistViewController: BATabBarControllerDelegate {
    func tabBarController(_ tabBarController: BATabBarController, didSelect: UIViewController) {

    }
    
    
    
}

extension TabbarReceptionistViewController: TabbarReceptionistViewProtocol {
	
}

extension TabbarReceptionistViewController {
    
}
