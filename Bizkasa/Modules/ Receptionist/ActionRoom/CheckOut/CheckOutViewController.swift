//
//  CheckOutViewController.swift
//  Bizkasa
//
//  Created DINH VAN TIEN on 3/21/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//
//  Template generated by Tien Dinh
//

import UIKit

class HeaderCheckOut {
    var title: String?
    var isCollapse = true

    init(title: String, isCollapse: Bool = true) {
        self.isCollapse = isCollapse
        self.title = title
    }
}


class CheckOutViewController: BaseViewController {

    @IBOutlet weak var tbCheckOut: UITableView!

	var presenter: CheckOutPresenterProtocol?

    var orderInfo: OrderInfoEntity! {
        didSet {
            tbCheckOut.reloadData()
        }
    }

    let listCheckOutInfo = ["Khách hàng",
                            "CMT",
                            "Loại phòng",
                            "Giá",
                            "Vào lúc",
                            "Trả lúc",
                            "Tính theo",
                            "Hình thức thanh toán",
                            "Ghi chú"]
    let listHeader = [HeaderCheckOut(title: "Thông tin chung", isCollapse: false),
                      HeaderCheckOut(title: "Tiền phòng"),
                      HeaderCheckOut(title: "Hóa đơn gộp thanh toán"),
                      HeaderCheckOut(title: "Tiền dịch vụ (ăn, uống,...)"),
                      HeaderCheckOut(title: "Các khoản phụ thu"),
                      HeaderCheckOut(title: "Khuyến mãi, giảm trừ"),
                      HeaderCheckOut(title: "Trả trước"),
                      HeaderCheckOut(title: "Danh sách đang ở"),
                      HeaderCheckOut(title: "Tổng cộng")]

    var room: RoomEntity!

	override func viewDidLoad() {
        super.viewDidLoad()

        getDataDetail()
        configureTableView()
    }

    private func getDataDetail() {
        if let orderRoom = self.room.OrderRoom, let orderID = orderRoom.OrderId {
            presenter?.getOrderForCheckOut(orderId: orderID, mode: 1)
        }
    }

    override func setUpNavigation() {
        addBackWhiteToNavigation()
    }

    private func configureTableView() {
        tbCheckOut.registerTableCell(TopInfoCheckOutCell.self)
        tbCheckOut.registerTableCell(HeaderCheckOutCell.self)
        tbCheckOut.registerTableCell(RoomChargeCell.self)
        tbCheckOut.registerTableCell(ServiceChargeCell.self)
        tbCheckOut.delegate = self
        tbCheckOut.dataSource = self
//        tbCheckOut.rowHeight = UITableView.automaticDimension
    }

}

extension CheckOutViewController: CheckOutViewProtocol {
    func didDeleteOrderDetail(result: BaseResponse?, error: APIError?) {
        if let _ = result {
            getDataDetail()
        } else {
            self.makeToast(message: error?.message?.first ?? "")
        }
    }

    func didAddOrderDetail(result: BaseResponse?, error: APIError?) {
        if let _ = result {
            getDataDetail()
        } else {
            self.makeToast(message: error?.message?.first ?? "")
        }
    }

    func didGetOrderForCheckOut(result: OrderInfoEntity?, error: APIError?) {
        if let result = result {
            self.orderInfo = result
        } else {
            self.makeToast(message: error?.message?.first ?? "")
        }
    }

	
}

extension CheckOutViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return listHeader.count
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if listHeader[section].isCollapse {
            return 1
        } else {
            switch section {
            case 0:
                return listCheckOutInfo.count + 1
            case 2:
                return orderInfo.OrderAttachments.count + 1
            case 1:
                return orderInfo.TimeUseds.count + 1
            case 3:
                return orderInfo.MiniBars.count + 1
            case 4:
                return orderInfo.Surcharges.count + 1
            case 5:
                return orderInfo.Deductibles.count + 1
            case 6:
                return orderInfo.Prepaids.count + 1

            default:
                return 1
            }
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let section = indexPath.section
        if indexPath.row == 0 {
            let cell = tableView.dequeueTableCell(HeaderCheckOutCell.self)
            if let orderInfo = orderInfo {
                cell.setData(header: self.listHeader[section], indexPath: indexPath, info: orderInfo)
                cell.selectCallback = {
                    self.listHeader[section].isCollapse = !self.listHeader[section].isCollapse
                    self.tbCheckOut.beginUpdates()
                    self.tbCheckOut.reloadSections([section], with: .automatic)
                    self.tbCheckOut.endUpdates()
                }
            }
           return cell
        } else {
            switch indexPath.section {
            case 0:
                let cell = tableView.dequeueTableCell(TopInfoCheckOutCell.self)
                cell.setData(info: orderInfo, indexPath: indexPath, title: listCheckOutInfo[row - 1])
                return cell
            case 1:
                let cell = tableView.dequeueTableCell(RoomChargeCell.self)
                cell.setData(timeUsed: self.orderInfo.TimeUseds[row-1])
                return cell
            case 2, 3,4,5,6:
                let cell = tableView.dequeueTableCell(ServiceChargeCell.self)
                cell.setData(info: orderInfo, indexPath: indexPath)
                cell.delegate = self
                return cell
            default:
                return UITableViewCell()
            }

        }

    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.row == 0 ? 40 : UITableView.automaticDimension
    }

}

extension CheckOutViewController: ServiceChargeCellDelegate {
    func deleteTapped(subCharge: SubFeeDetailEntity, indexPath: IndexPath) {
        presenter?.deleteOrderDetail(param: subCharge)
    }
}

extension CheckOutViewController: HeaderCheckOutCellDelegate {
    func btnAddMoreTapped(indexPath: IndexPath) {
        switch indexPath.section {
        case 1:
            break
        default:
            break
        }
    }
}
