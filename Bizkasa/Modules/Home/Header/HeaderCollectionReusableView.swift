//
//  HeaderCollectionReusableView.swift
//  Bizkasa
//
//  Created by Tien Dinh on 28/03/2021.
//  Copyright © 2021 DINH VAN TIEN. All rights reserved.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
    
    @IBOutlet weak var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backgroundColor = AppColor.secondMain
    }
    
}
