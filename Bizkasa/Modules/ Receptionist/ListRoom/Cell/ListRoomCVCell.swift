//
//  ListRoomCVCell.swift
//  Bizkasa
//
//  Created by DINH VAN TIEN on 2/23/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//

import UIKit
import DropDown

protocol ListRoomCVCellDelegate: class {
    func actionTapped(type: Int)
}

class ListRoomCVCell: UICollectionViewCell {

    @IBOutlet weak var vBackground: UIView!
    @IBOutlet weak var imgLogo: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var vDropdownLayout: UIView!

    let dropdown = DropDown()

    weak var delegate: ListRoomCVCellDelegate?

    var isEmpty = true {
        didSet {
            if self.isEmpty {
                self.dropdown.dataSource = ["Nhận phòng", "Nhận phòng theo đoàn"]
            } else {
                self.dropdown.dataSource = ["Trả phòng/Cập nhật HĐ", "Trả phòng theo đoàn", "Gộp thanh toán"]
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configureDropDown()
    }

    private func configureDropDown() {
        // Top of drop down will be below the anchorView
        dropdown.anchorView = self.vDropdownLayout
        dropdown.backgroundColor = .orange
        dropdown.textColor = .white

        //        dropdown.bottomOffset = CGPoint(x: 0, y:(dropdown.anchorView?.plainView.bounds.height)!)
        //
        dropdown.selectionAction = { [weak self] (index: Int, item: String) in
            self?.delegate?.actionTapped(type: index)
        }
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        vBackground.setShadow()
    }

    @IBAction func btnShowActionTapped() {
        dropdown.show()
    }

}
