//
//  RateSettingCell.swift
//  Bizkasa
//
//  Created by Tien Dinh on 9/20/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//

import UIKit

class RateSettingCell: UITableViewCell {
    
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbDayRate: UILabel!
    @IBOutlet weak var lbNightRate: UILabel!
    @IBOutlet weak var lbMonthRate: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
        selectionStyle = .none
    }
    
    func setData(detail: PriceEntity) {
        guard let configureRow = detail.ConfigPriceRow else { return }
        lbTitle.text = configureRow.Name
        lbDayRate.text = "\(configureRow.PriceByDay*.formattedWithSeparator)"
        lbNightRate.text = "\(configureRow.PriceByNight*.formattedWithSeparator)"
        lbMonthRate.text = "\(configureRow.PriceByMonth*.formattedWithSeparator)"
        self.layoutIfNeeded()
    }
    
}
