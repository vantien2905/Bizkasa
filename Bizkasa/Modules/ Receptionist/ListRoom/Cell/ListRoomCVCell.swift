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
    func actionTapped(type: String, room: RoomEntity?)
}

enum ActionRoom: String {
    case checkIn = "Nhận phòng"
    case checkInGroup = "Nhận phòng theo đoàn"
    case checkOut = "Trả phòng/Cập nhật HĐ"
    case checkOutGroup = "Trả phòng theo đoàn"
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
        dropdown.anchorView = self.vDropdownLayout
        dropdown.selectionAction = { [weak self] (index: Int, item: String) in
            guard let self = self else { return }
            self.delegate?.actionTapped(type: item, room: self.room)
        }
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)
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

            dropdown.backgroundColor = AppColor.normalLightGray
            dropdown.textColor = .black
            dropdown.separatorColor = .black

        } else {
            vBackground.setShadow(color: AppColor.normalGreen)
            lbTitle.textColor = .white

            dropdown.backgroundColor = .orange
            dropdown.textColor = .white
            dropdown.separatorColor = .white
        }
    }

}
