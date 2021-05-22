//
//  FooterRateSettingCell.swift
//  Bizkasa
//
//  Created by Tien Dinh on 11/1/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//

import UIKit

protocol FooterRateSettingCellDelegate: class {
    func btnAddConfigureTapped(indexPath: IndexPath)
}

class FooterRateSettingCell: UITableViewCell {
    
    weak var delegate: FooterRateSettingCellDelegate?
    
    var indexPath: IndexPath!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func btnAddConfigureTapped() {
        delegate?.btnAddConfigureTapped(indexPath: indexPath)
    }
    
}
