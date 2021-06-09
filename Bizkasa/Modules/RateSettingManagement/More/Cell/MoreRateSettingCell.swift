//
//  MoreRateSettingCell.swift
//  Bizkasa
//
//  Created by Tien Dinh on 10/24/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//

import UIKit

class MoreRateSettingCell: UITableViewCell {
    
    @IBOutlet weak var contentLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setData(configure: ConfigPriceEntity?, indexPath: IndexPath) {
        let row = indexPath.row
        let section = indexPath.section
        guard let config = configure else { return }
        switch Surchanrge(rawValue: section) {
        case .checkoutDayList:
            setText(config.CheckoutDayList[row], row: row)
        case .checkoutNightList:
            setText(config.CheckoutNightList[row], row: row)
        case .checkinDayList:
            setText(config.CheckinDayList[row], row: row)
        case .checkinNightList:
            setText(config.CheckinNightList[row], row: row)
        case .addtionCustomerList:
            setText(config.AddtionCustomerList[row], row: row)
        default:
            break
        }
    }
    
    private func setText(_ detail: CheckoutEntity, row: Int) {
        contentLabel.text = "Quá \(row + 1) giờ cộng thêm \(detail.Value*.formattedWithSeparator)đ"
    }
    
}
