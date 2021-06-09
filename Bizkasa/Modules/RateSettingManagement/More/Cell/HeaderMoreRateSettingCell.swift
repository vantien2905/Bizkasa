//
//  HeaderMoreRateSettingCell.swift
//  Bizkasa
//
//  Created by Tien Dinh on 10/24/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//

import UIKit

class HeaderMoreRateSettingCell: UITableViewHeaderFooterView {
    
    @IBOutlet weak var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setData(section: Int) {
        switch Surchanrge(rawValue: section) {
        case .priceByHour:
            setText("Giá phòng theo giờ")
        case .checkoutDayList:
            setText("Phụ thu trả phòng quá giờ tính theo ngày")
        case .checkoutNightList:
            setText("Phụ thu trả phòng quá giờ tính qua đêm")
        case .checkinDayList:
            setText("Phụ thu nhận phòng sớm tính theo ngày")
        case .checkinNightList:
            setText("Phụ thu nhận phòng sớm tính qua đêm")
        case .addtionCustomerList:
            setText("Phụ thu thêm khách")
        default:
            break
        }
    }
    
    private func setText(_ text: String?) {
        titleLabel.text = text
    }
    
}
