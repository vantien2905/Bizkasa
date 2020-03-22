//
//  HeaderCheckOutCell.swift
//  Bizkasa
//
//  Created by DINH VAN TIEN on 3/22/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//

import UIKit

class HeaderCheckOutCell: UITableViewCell {

    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var imgCollapse: UIImageView!

    var selectCallback: (()->Void)?

//    var headerCheckout: HeaderCheckOut? {
//        didSet {
//            self.setData()
//        }
//    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setData(header: HeaderCheckOut) {
        lbTitle.text = header.title
        imgCollapse.rotate(header.isCollapse ? .pi : 0)
    }

    @IBAction func btnSelectTapped() {
//        guard let data = headerCheckout else { return }
//        data.isCollapse = !data.isCollapse
//        imgCollapse.rotate(data.isCollapse ? .pi : 0)
        imgCollapse.rotate(.pi)
        selectCallback?()

    }
    
}
