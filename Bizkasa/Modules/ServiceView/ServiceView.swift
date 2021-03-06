//
//  ServiceView.swift
//  Bizkasa
//
//  Created by DINH VAN TIEN on 3/21/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//

import Foundation
import UIKit

class ServiceView: BaseViewXib {

    @IBOutlet weak var vTotal           : AppDropdownBorder!
    @IBOutlet weak var lbService        : UILabel!
    @IBOutlet weak var heightTableView  : NSLayoutConstraint!
    @IBOutlet weak var tbListWidget     : UITableView!
    @IBOutlet weak var lbTotalPrice     : UILabel!
    @IBOutlet weak var vTotalPrice      : UIView!

    var widget: WidgetEntity?
    var total: Int = 1
    var totalAmount = 0
    var listWidget: [(WidgetEntity, Int)] = [] {
        didSet {
            let totalPrice = self.listWidget.reduce(Int(0)) { result, item in
                return result + ((item.0.Price*) * item.1)
            }
            self.totalAmount = totalPrice
            vTotalPrice.isHidden = totalPrice == 0
            lbTotalPrice.text = "\(totalPrice.formattedWithSeparator) VNĐ"
            heightTableView.constant = CGFloat(self.listWidget.count * 40)
            tbListWidget.reloadData()
        }
    }


    var addNewCallBack: ((_ widget: WidgetEntity, _ total: Int) -> Void)?

    override func setUpViews() {
        vTotal.dataSource = ["1", "2", "3", "4", "5"]

        vTotal.dropDownCallBack = { [weak self] (index, item) in
            self?.total = index + 1
        }

        vTotalPrice.isHidden = true
        heightTableView.constant = 0

        configureTableView()
    }

    private func configureTableView() {
        tbListWidget.registerTableCell(WidgetCell.self)
        tbListWidget.dataSource = self
        tbListWidget.delegate = self
        tbListWidget.rowHeight = 40
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
            if checkDouplicate() {
                tbListWidget.reloadData()
            } else {
                widget.Quantity = total
                widget.SubAmount = "\(widget.Price* * total)"
                widget.Descriptions = widget.Name
                self.listWidget.append((widget, total))
            }
        } else {
            UIApplication.topViewController()?.makeToast(message: "Bạn chưa chọn dịch vụ")
        }

    }

    private func checkDouplicate() -> Bool {
        guard let widget = widget else { return false}
        for (index, item) in listWidget.enumerated() {
            if item.0.Id == widget.Id {
                
                self.listWidget[index].1 += total
                self.listWidget[index].0.Quantity = self.listWidget[index].1
                self.listWidget[index].0.SubAmount = "\(self.listWidget[index].0.Price*) * \(self.listWidget[index].1)"
                return true
            }
        }
        return false
    }
}

extension ServiceView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listWidget.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueTableCell(WidgetCell.self)
        cell.setData(widget: listWidget[indexPath.row].0,
                     total: listWidget[indexPath.row].1,
                     indexPath: indexPath)
        cell.deleteCallback = { indexPath in
            self.listWidget.remove(at: indexPath.row)
        }
        return cell
    }
}
