//
//  WidgetCell.swift
//  Bizkasa
//
//  Created by DINH VAN TIEN on 3/21/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//

import UIKit

class WidgetCell: UITableViewCell {

    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbTotal: UILabel!
    @IBOutlet weak var lbPrice: UILabel!

    var indexPath: IndexPath!

    var deleteCallback: ((_ indexPath: IndexPath) -> Void)?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        selectionStyle = .none
        // Configure the view for the selected state
    }

    func setData(widget: WidgetEntity, total: Int, indexPath: IndexPath) {
        self.indexPath = indexPath
        lbTitle.text = widget.Name
        lbTotal.text = "\(total)"
        lbPrice.text = "\((widget.Price ?? 0) * Float(total))"
    }

    @IBAction func btnDeleteWidgetTapped() {
        deleteCallback?(indexPath)
    }
    
}
