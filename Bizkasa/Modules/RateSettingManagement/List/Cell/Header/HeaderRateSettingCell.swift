//
//  HeaderRateSettingCell.swift
//  Bizkasa
//
//  Created by Tien Dinh on 9/20/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//

import UIKit

enum RateSettingAction {
    case edit
    case delete
}

protocol HeaderRateSettingCellDelegate: class {
    func rateSettingAction(type: RateSettingAction, rateSetting: RateSettingEntity)
}

class HeaderRateSettingCell: UITableViewHeaderFooterView {
    
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbContent: UILabel!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    
    weak var delegate: HeaderRateSettingCellDelegate?
    
    var rateSetting: RateSettingEntity!

    override func awakeFromNib() {
        super.awakeFromNib()
        editButton.imageView?.contentMode = .scaleToFill
        deleteButton.imageView?.contentMode = .scaleToFill
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
    }

    func setData(detail: RateSettingEntity) {
        self.rateSetting = detail
        guard let room = detail.RoomClass else { return }
        lbTitle.text = "\(room.Name&)"
        lbContent.text = "(\(room.NumCustomer*) người - \(room.NumBed*) giường)"
    }
    
    @IBAction func deleteButtonTapped() {
        delegate?.rateSettingAction(type: .delete, rateSetting: rateSetting)
    }
    
    @IBAction func editButtonTapped() {
        delegate?.rateSettingAction(type: .edit, rateSetting: rateSetting)
    }
}
