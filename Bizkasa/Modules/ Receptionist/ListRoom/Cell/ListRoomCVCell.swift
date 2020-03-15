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

    var room: RoomEntity? {
        didSet {
//            self.setData()
        }
    }

    weak var delegate: ListRoomCVCellDelegate?

    var isAvailable = true {
        didSet {
            if self.isAvailable {
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
//        vBackground.setShadow()
        setData()
    }

    @IBAction func btnShowActionTapped() {
        dropdown.show()
    }

    private func setData() {
        guard let room = room else { return }
        lbTitle.text = "Phòng \(room.Name&)"
        self.isAvailable = room.OrderRoom == nil
        if let order = room.OrderRoom {
            vBackground.setShadow(color: AppColor.normalLightGray)
            lbTitle.textColor = .black
        } else {
            vBackground.setShadow(color: AppColor.normalGreen)
            lbTitle.textColor = .white
        }
    }

}
