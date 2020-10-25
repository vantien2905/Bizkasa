//
//  AddSurchargeCell.swift
//  Bizkasa
//
//  Created by Tien Dinh on 10/25/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//

import UIKit

class AddSurchargeCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceTextField: UITextField!
    
    var removeSurchargeCallback: ((_ row: IndexPath)->Void)?
    
    var indexPath: IndexPath!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        selectionStyle = .none
    }
    
    func setData(indexPath: IndexPath) {
        self.indexPath = indexPath
        titleLabel.text = "\(indexPath.row + 1)h"
    }
    
    @IBAction func removeSurchargeTapped() {
        removeSurchargeCallback?(indexPath)
    }
    
}
