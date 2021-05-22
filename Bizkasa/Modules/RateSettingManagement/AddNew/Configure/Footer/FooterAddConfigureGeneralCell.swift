//
//  FooterAddConfigureGeneralCell.swift
//  Bizkasa
//
//  Created by Tien Dinh on 15/11/2020.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//

import UIKit

class FooterAddConfigureGeneralCell: UITableViewCell {
    
    @IBOutlet weak var defaultButton: UIButton!
    @IBOutlet weak var activeButton: UIButton!
    
    var actionCallBack: ((_ default: Bool, _ active: Bool) -> Void)?

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setData(config: ConfigPriceEntity?) {
        guard let config = config else { return }
        defaultButton.isSelected = config.IsDefault
        activeButton.isSelected = config.IsActive
    }
    
    @IBAction func defaultButtonTapped() {
        defaultButton.isSelected = !defaultButton.isSelected
        actionCallBack?(defaultButton.isSelected, activeButton.isSelected)
    }
    
    @IBAction func activeButtonTapped() {
        activeButton.isSelected = !activeButton.isSelected
        actionCallBack?(defaultButton.isSelected, activeButton.isSelected)
    }
    
}
