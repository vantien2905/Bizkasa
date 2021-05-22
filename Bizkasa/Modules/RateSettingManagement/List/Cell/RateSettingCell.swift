//
//  RateSettingCell.swift
//  Bizkasa
//
//  Created by Tien Dinh on 9/20/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//

import UIKit
import SwipeCellKit

protocol RateSettingCellDelegate: class {
    func hourButtonTapped(indexPath: IndexPath)
    func moreButtonTapped(indexPath: IndexPath)
}

class RateSettingCell: SwipeTableViewCell {
    
    @IBOutlet weak var lbTitle      : UILabel!
    @IBOutlet weak var lbDayRate    : UILabel!
    @IBOutlet weak var lbNightRate  : UILabel!
    @IBOutlet weak var lbMonthRate  : UILabel!
    
    weak var rateDelegate: RateSettingCellDelegate?

    var indexPath: IndexPath = .init(row: 0, section: 0)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
        selectionStyle = .none
    }
    
    func setData(detail: PriceEntity, indexPath: IndexPath) {
        self.indexPath = indexPath
        guard let configureRow = detail.ConfigPriceRow else { return }
        lbTitle.text = configureRow.Name
        lbDayRate.text = "\(configureRow.PriceByDay*.formattedWithSeparator)đ"
        lbNightRate.text = "\(configureRow.PriceByNight*.formattedWithSeparator)đ"
        lbMonthRate.text = "\(configureRow.PriceByMonth*.formattedWithSeparator)đ"
        self.layoutIfNeeded()
    }
    
    @IBAction func hourButtonTapped() {
        rateDelegate?.hourButtonTapped(indexPath: indexPath)
    }
    
    @IBAction func moreButtonTapped() {
        rateDelegate?.moreButtonTapped(indexPath: indexPath)
    }
    
}
