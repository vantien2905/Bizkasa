//
//  HeaderInfoCell.swift
//  Bizkasa
//
//  Created by DINH VAN TIEN on 3/22/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//

import UIKit

class TopInfoCheckOutCell: UITableViewCell {

    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbContent: UILabel!
    @IBOutlet weak var vCalendar: TextFieldCalendar!
    @IBOutlet weak var vDropdown: AppDropdownBorder!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        vCalendar.hideTitle()
        vDropdown.hideTextAndLogo()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        selectionStyle = .none
    }

    func setData(info: OrderInfoEntity?, indexPath: IndexPath, title: String) {
        lbTitle.text = title
        guard let info = info else { return }
        switch indexPath.row - 1 {
        case 0:
            setContentLabel(text: info.CustomerName)
        case 1:
            setContentLabel(text: info.Card* != 0 ? "\(info.Card*)" : "-")
        case 2:
            setContentLabel(text: info.RoomClassName)
        case 3:
            setContentLabel(text: "\(info.Price*.formattedWithSeparator)")
        case 4:
            setContentLabel(text:"\(info.CheckInTimeText&) - \(info.CheckInDateView&)")
        case 5:
            setContentLabel(text: "\(info.CheckOutTimeText&) - \(info.CheckOutDateView&)")
        case 6:
            setContentDropdown()
            vDropdown.dataSource = ["Theo giờ", "Theo ngày", "Qua đêm", "Theo tháng"]
        case 7:
            setContentDropdown()
            vDropdown.dataSource = ["Tiền mặt", "Chuyển khoản", "Thanh toán online", "Khác"]
        case 8:
            setContentCalendar()
        default:
            break
        }
    }

    private func setContentLabel(text: String?) {
        lbContent.text = text
        lbContent.isHidden = false
        vCalendar.isHidden = true
        vDropdown.isHidden = true
    }

    private func setContentCalendar() {
        lbContent.isHidden = true
        vCalendar.isHidden = false
        vDropdown.isHidden = true
    }

    private func setContentDropdown() {
        lbContent.isHidden = true
        vCalendar.isHidden = true
        vDropdown.isHidden = false
    }
}
