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
        // Initialization code
    }
    
    func setData(section: Int) {
        switch section {
        case Surchanrge.checkoutDayList.rawValue:
            setText("Phụ thu trả phòng quá giờ tính theo ngày")
        case Surchanrge.checkoutNightList.rawValue:
            setText("Phụ thu trả phòng quá giờ tính qua đêm")
        case Surchanrge.checkinDayList.rawValue:
            setText("Phụ thu nhận phòng sớm tính theo ngày")
        case Surchanrge.checkinNightList.rawValue:
            setText("Phụ thu nhận phòng sớm tính qua đêm")
        case Surchanrge.addtionCustomerList.rawValue:
            setText("Phụ thu thêm khách")
        default:
            break
        }
    }
    
    private func setText(_ text: String?) {
        titleLabel.text = text
    }
    
}
