//
//  HourRateSettingCell.swift
//  Bizkasa
//
//  Created by Tien Dinh on 10/11/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//

import UIKit

enum PriceHourSetting: String {
    case onehour = "Giờ đầu:"
    case twoHour = "Giờ thứ:"
    case overHour = "Quá thời gian trên tính 1 ngày"
}

class HourRateSettingCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(detail: CheckoutEntity?, row: Int) {
        guard let detail = detail else { return }
        contentLabel.text = detail.Value*.formattedWithSeparator
        if row == 0 {
            titleLabel.text = PriceHourSetting.onehour.rawValue
        } else {
            titleLabel.text = "Giờ thứ \(row + 1):"
        }
    }
}
