//
//  ServiceViewSingle.swift
//  Bizkasa
//
//  Created by DINH VAN TIEN on 4/11/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//

import Foundation
import UIKit


class ServiceViewSingle: BaseViewXib {

    @IBOutlet weak var vTotal: AppDropdownBorder!
    @IBOutlet weak var lbService: UILabel!

    var widget: WidgetEntity?
    var total: Int = 1


    var addNewCallBack: ((_ widget: WidgetEntity, _ total: Int) -> Void)?

    override func setUpViews() {
        vTotal.dataSource = ["1", "2", "3", "4", "5"]

        vTotal.dropDownCallBack = { [weak self] (index, item) in
            self?.total = index + 1
        }
    }

    @IBAction func btnServiceTapped() {
        let vc = ListServiceRouter.createModule()
        vc.selectedCallback = {[weak self] widget in
            guard let self = self else { return }
            self.lbService.text = widget.NamePrice
            self.widget = widget

        }
        UIApplication.topViewController()?.present(controller: vc.convertNavi())

    }

    @IBAction func btnAddNewTapped() {
        if let widget = widget, total != 0 {
            addNewCallBack?(widget, total)
        } else {
            UIApplication.topViewController()?.makeToast(message: "Bạn chưa chọn dịch vụ")
        }

    }

}
