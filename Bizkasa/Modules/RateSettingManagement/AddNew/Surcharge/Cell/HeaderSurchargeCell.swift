//
//  HeaderSurchargeCell.swift
//  Bizkasa
//
//  Created by Tien Dinh on 10/25/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//

import UIKit

class HeaderSurchargeCell: UITableViewHeaderFooterView {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    var section: Int!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    var addCallback: ((_ section: Int)->Void)?
    
    func setTitle(section: Int) {
        titleLabel.text = SurchanrgeType(rawValue: section)?.name
    }
    
    @IBAction func addButtonTapped() {
        addCallback?(section)
    }
}
