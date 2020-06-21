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
    case clean = "Đã dọn dẹp"
}

class ListRoomCVCell: UICollectionViewCell {

    @IBOutlet weak var vBackground: UIView!
    @IBOutlet weak var imgLogo: UIImageView!
    @IBOutlet weak var lbRoomName: UILabel!
    @IBOutlet weak var lbTime: UILabel!
    @IBOutlet weak var lbStatus: UILabel!
    @IBOutlet weak var vDropdownLayout: UIView!

    let dropdown = DropDown()

    var room: RoomEntity? {
        didSet {
//            self.setData()
        }
    }

    weak var delegate: ListRoomCVCellDelegate?

    var isAvailable: Int = 0 {
        didSet {
            switch self.isAvailable {
            case 1:
                self.dropdown.dataSource = ["Trả phòng/Cập nhật HĐ", "Trả phòng theo đoàn", "Gộp thanh toán"]
            case 2:
                self.dropdown.dataSource = ["Nhận phòng", "Nhận phòng theo đoàn"]
            case 3:
                self.dropdown.dataSource = ["Đã dọn dẹp"]
            default:
                break
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
        lbRoomName.text = "\(room.Name&)"
        self.isAvailable = room.RoomStatus*
        setColor(background:  UIColor(hexString: room.ColorStatus&), text: .white)
        if let order = room.OrderRoom {
            lbTime.text = order.TimeSpend
            lbStatus.text = order.CaculatorModeView
        } else {
            lbTime.text = ""
            if room.RoomStatus == 3 {
                lbStatus.text = "Dọn dẹp..."
            } else {
                lbStatus.text = "Trống"
            }
        }
    }

    private func setColor(background: UIColor, text: UIColor) {
        vBackground.setShadow(color: background)
        lbRoomName.textColor = text

        dropdown.backgroundColor = background
        dropdown.textColor = text
        dropdown.separatorColor = text

    }

}
