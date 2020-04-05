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
        lbRoomName.text = "\(room.Name&)"
        self.isAvailable = room.OrderRoom == nil
        if let order = room.OrderRoom {
            lbTime.text = order.TimeSpend
            lbStatus.text = order.CaculatorModeView
            switch order.CaculatorMode {
            case 1:
                setColor(background: AppColor.day, text: .white)
            case 2:
                setColor(background: AppColor.overNight, text: .white)
            case 3:
                setColor(background: AppColor.hour, text: .white)
            case 4:
                setColor(background: AppColor.month, text: .white)
            default:
                break
            }

        } else {
            lbTime.text = ""
            lbStatus.text = "Trống"
            setColor(background: AppColor.normalGreen, text: .white)

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
