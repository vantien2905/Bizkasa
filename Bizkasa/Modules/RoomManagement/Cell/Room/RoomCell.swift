//
//  RoomCell.swift
//  Bizkasa
//
//  Created by Tien Dinh on 7/19/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//

import UIKit
import SwipeCellKit

class RoomCell: SwipeTableViewCell {
    
    @IBOutlet weak var lbRoomName: UILabel!
    @IBOutlet weak var lbRoomType: UILabel!
    
    var room: RoomEntity! {
        didSet {
            self.setData()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData() {
        lbRoomName.text = room.Name
        lbRoomType.text = room.RoomClassName
    }
    
}
