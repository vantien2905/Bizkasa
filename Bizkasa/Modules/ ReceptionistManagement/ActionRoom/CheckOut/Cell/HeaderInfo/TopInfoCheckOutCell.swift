//
//  HeaderInfoCell.swift
//  Bizkasa
//
//  Created by DINH VAN TIEN on 3/22/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//

import UIKit

protocol TopInfoCheckOutCellDelegate: class {
    func changeCalculatorMode(index: Int)
    func changeCustomerName(text: String)
    func changeNote(text: String)
}

class TopInfoCheckOutCell: UITableViewCell {

    @IBOutlet weak var lbTitle      : UILabel!
    @IBOutlet weak var lbContent    : UILabel!
    @IBOutlet weak var textField    : UITextField!
    @IBOutlet weak var vDropdown    : AppDropdownBorder!
    @IBOutlet weak var vCalendar    : TextFieldCalendar!

    weak var delegate: TopInfoCheckOutCellDelegate?

    var indexType = 0

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        textField.addTarget(self,
                            action: #selector(changeTextValue),
                            for: .editingChanged)
        vDropdown.hideTextAndLogo()
        vCalendar.hideTitle()
        vCalendar.isChangeDate(false)

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        selectionStyle = .none
    }

    func setData(info: OrderInfoEntity?, indexPath: IndexPath, title: String) {
        lbTitle.text = title
        guard let info = info else { return }
        indexType = indexPath.row - 1
        switch indexPath.row - 1 {
        case 0:
            setContentTextField(text: info.CustomerName)
        case 1:
            setContentLabel(text: info.Card* != 0 ? "\(info.Card*)" : "-")
        case 2:
            setContentLabel(text: info.RoomClassName)
        case 3:
            setContentLabel(text: "\(info.Price*.formattedWithSeparator)")
        case 4:
            setCalendar(text:"\(info.CheckInTimeText&) - \(info.CheckInDateView&)")
        case 5:
            setCalendar(text: "\(info.CheckOutTimeText&) - \(info.CheckOutDateView&)")
        case 6:
            setContentDropdown()
            vDropdown.itemSelected = info.CaculatorMode* - 1
            vDropdown.dataSource = CaculatorMode.allValues.map({$0.title&})
            vDropdown.dropDownCallBack = {[weak self] (index, item) in
                self?.delegate?.changeCalculatorMode(index: index)
            }
        case 7:
            setContentDropdown()
            vDropdown.dataSource = ["Tiền mặt",
                                    "Chuyển khoản",
                                    "Thanh toán online",
                                    "Khác"]
        case 8:
            if info.Notes&.isEmpty {
                textField.placeholder = "Nhập ghi chú"
                lbContent.isHidden = true
                textField.isHidden = false
                vDropdown.isHidden = true
                vCalendar.isHidden = true
            } else {
                setContentTextField(text:  info.Notes)
            }
        default:
            break
        }
    }

    private func setContentLabel(text: String?) {
        lbContent.text = text
        lbContent.isHidden = false
        textField.isHidden = true
        vDropdown.isHidden = true
        vCalendar.isHidden = true
    }

    private func setContentTextField(text: String?) {
        textField.text = text
        lbContent.isHidden = true
        textField.isHidden = false
        vDropdown.isHidden = true
        vCalendar.isHidden = true
    }

    private func setContentDropdown() {
        lbContent.isHidden = true
        textField.isHidden = true
        vDropdown.isHidden = false
        vCalendar.isHidden = true
    }

    private func setCalendar(text: String?) {
        vCalendar.setText(text&)
        vCalendar.isHidden = false
        lbContent.isHidden = true
        textField.isHidden = true
        vDropdown.isHidden = true

    }

    @objc func changeTextValue() {
        if indexType == 0 {
            delegate?.changeCustomerName(text: textField.text&)
        } else {
            delegate?.changeNote(text: textField.text&)
        }

    }
}
