//
//  CheckInViewController.swift
//  Bizkasa
//
//  Created DINH VAN TIEN on 2/29/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//
//  Template generated by Tien Dinh
//

import UIKit

class CheckInViewController: BaseViewController {

    @IBOutlet weak var tfCustomerName       : AppTextFieldLogo!
    @IBOutlet weak var tfIndentifierNumber  : AppTextFieldLogo!
    @IBOutlet weak var tfIndentifierDate    : TextFieldCalendar!
    @IBOutlet weak var tfAdress             : AppTextFieldLogo!
    @IBOutlet weak var tfCheckInTime        : AppDateTime!
    @IBOutlet weak var vTimeType            : AppDropdown!
    @IBOutlet weak var vConfigurePrice      : AppDropdown!
    @IBOutlet weak var vService             : ServiceView!
    @IBOutlet weak var tvNote               : AppTextViewLogo!

	var presenter: CheckInPresenterProtocol?

    var listPrice: [ConfigPriceEntity] = [] {
        didSet {
            self.vConfigurePrice.dataSource = self.listPrice.map({$0.Name&})
            self.configPrice = self.listPrice.first
        }
    }

    var configPrice: ConfigPriceEntity! {
        didSet {
            price = self.configPrice.PriceByDay*
        }
    }

    var room: RoomEntity!

    var price = 0

    var calculatorMode = 3

    var customer: [CustomerEntity] = []

	override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    private func getData() {
        guard let roomId = room.Id else { return }
        presenter?.getConfigPrice(roomId: roomId)
    }

    override func setUpNavigation() {
        setTitleNavigation(title: "Phòng \(room.Name&)")
        addBackWhiteToNavigation()
        addButtonTextToNavigation(title: "Nhận", style: .right, action: #selector(btnAcceptTapped))
    }

    override func setUpViews() {
        tfCustomerName.setTitleAndLogo(AppImage.imgUser, title: "Khách hàng")
        tfIndentifierNumber.setTitleAndLogo(AppImage.imgReceipts, title: "CMT")
        tfAdress.setTitleAndLogo(AppImage.imgAddress, title: "Địa chỉ")

        vTimeType.setTitleAndLogo(AppImage.imgTime, title: "Tính theo")
        vConfigurePrice.setTitleAndLogo(AppImage.price, title: "Cấu hình giá")
//        vService.setTitleAndLogo(AppImage.imgPayment, title: "Dịch vụ")
        tfIndentifierDate.setTitleAndLogo(AppImage.imgTime, title: "Ngày cấp")
        tfCheckInTime.setTitleAndLogo(AppImage.imgTime, title: "Thời gian")

        tvNote.setTitleAndLogo(AppImage.imgNote, title: "Ghi chú")
        vTimeType.dataSource = CaculatorMode.allValues.map({$0.title&})// ["Theo giờ", "Theo ngày", "Qua đêm", "Theo tháng"]

        tfCheckInTime.titleDatePicker = ("NHẬN PHÒNG", "TRẢ PHÒNG")
//        tfCheckInTime.dateTime = "2020-04-06T05:02:00"
        tfCheckInTime.haveSetTime = true

        vTimeType.dropDownCallBack = {[weak self] (index, item) in
            guard let self = self else { return }
            switch index {
            case 0:
                self.calculatorMode = CaculatorMode.day.value.value*
            case 1:
                self.calculatorMode = CaculatorMode.overNight.value.value*
            case 2:
                self.calculatorMode = CaculatorMode.hour.value.value*
            case 3:
                self.calculatorMode = CaculatorMode.month.value.value*
            default:
                break
            }
        }
    }

    @objc func btnAcceptTapped() {

        if tfCustomerName.getText().isEmpty {
            let param = CheckInParam()
            param.RoomId = room.Id
            param.RoomClassName = room.RoomClassName
            param.RoomName = room.Name
            param.CustomerName = "Khách không CMT"
            param.Price = self.price
            param.OrderStatus = 4
            param.CaculatorMode = calculatorMode
            let list = vService.listWidget.map { (item, total) -> WidgetEntity in
                item.Quantity = total
                return item
            }
            param.Services = list
            param.Notes = tvNote.getText()
            presenter?.addOrder(param: param)
        } else {
            let addCustomerParam = AddCustomerParam()
            addCustomerParam.Address = tfAdress.getText()
            addCustomerParam.Name = tfCustomerName.getText()
            addCustomerParam.PassportId = tfIndentifierNumber.getText()
            addCustomerParam.PassportCreatedDate = tfIndentifierDate.dateTime
            addCustomerParam.OrderId = 0
            presenter?.addCustomer(param: addCustomerParam)
        }



    }

}

extension CheckInViewController: CheckInViewProtocol {
    func didAddCustomer(result: CustomerEntity?, error: APIError?) {
        if let result = result {
//            self.customer.append(result)
            let param = CheckInParam()
            param.RoomId = room.Id
            param.RoomClassName = room.RoomClassName
            param.RoomName = room.Name
            param.CustomerName = tfCustomerName.getText().isEmpty ? "Khách không CMT" : tfCustomerName.getText()
            param.Price = self.price
            param.OrderStatus = 4
            param.CaculatorMode = calculatorMode
            let list = vService.listWidget.map { (item, total) -> WidgetEntity in
                item.Quantity = total
                return item
            }
            param.Services = list
            param.Notes = tvNote.getText()
            param.Customers = [result]
            presenter?.addOrder(param: param)
        } else {
             self.makeToast(message: error?.message?.first ?? "")
        }
    }

    func didAddOrder(result: BaseResponse?, error: APIError?) {
        if let _ = result {
            NotificationCenter.default.post(name: .refreshReceptionist, object: nil)
            self.closePage()
        } else {
            self.makeToast(message: error?.message?.first ?? "")
        }
    }

    func didGetConfigPrice(result: [ConfigPriceEntity]?, error: APIError?) {
        if let result = result {
            self.listPrice = result
        } else {
            self.makeToast(message: error?.message?.first ?? "")
        }
    }

	
}
