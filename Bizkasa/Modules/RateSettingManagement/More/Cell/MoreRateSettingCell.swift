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
        switch section {
        case Surchanrge.checkoutDayList.rawValue:
            setText(config.CheckoutDayList[row], row: row)
        case Surchanrge.checkoutNightList.rawValue:
            setText(config.CheckoutNightList[row], row: row)
        case Surchanrge.checkinDayList.rawValue:
            setText(config.CheckinDayList[row], row: row)
        case Surchanrge.checkinNightList.rawValue:
            setText(config.CheckinNightList[row], row: row)
        case Surchanrge.addtionCustomerList.rawValue:
            setText(config.AddtionCustomerList[row], row: row)
        default:
            break
        }
    }
    
    private func setText(_ detail: CheckoutEntity, row: Int) {
        contentLabel.text = "Quá \(row + 1) giờ cộng thêm \(detail.Value*.formattedWithSeparator)đ"
    }
    
}
