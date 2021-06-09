//
//  Enum.swift
//  Vebrary
//
//  Created by DINH VAN TIEN on 5/28/19.
//  Copyright © 2019 DINH VAN TIEN. All rights reserved.
//

import UIKit

enum OrderStatus {
    case NotPaid
    case Paid
    case UnCheckIn
    case CheckIn
    case Booking
    case Cancel
    case Completed
    case Merged
    
    var value: ItemEntity {
        switch self {
        case .NotPaid:
            return ItemEntity(title: "Chưa thanh toán", value: 1)
        case .Paid:
            return ItemEntity(title: "Công nợ", value: 2)
        case .UnCheckIn:
            return ItemEntity(title: "Chưa Checkin", value: 3)
        case .CheckIn:
            return ItemEntity(title: "Đã Checkin", value: 4)
        case .Booking:
            return ItemEntity(title: "Đã đặt trước", value: 5)
        case .Cancel:
            return ItemEntity(title: "Hủy", value: 6)
        case .Completed:
            return ItemEntity(title: "Đã thanh toán", value: 7)
        case .Merged:
            return ItemEntity(title: "Đã gộp thanh toán", value: 8)
        }
    }
    
    static func getTitle(_ value: Int) -> ItemEntity {
        switch value {
        case 1: return OrderStatus.NotPaid.value
        case 2: return OrderStatus.Paid.value
        case 3: return OrderStatus.UnCheckIn.value
        case 4: return OrderStatus.CheckIn.value
        case 5: return OrderStatus.Booking.value
        case 6: return OrderStatus.Cancel.value
        case 7: return OrderStatus.Completed.value
        case 8: return OrderStatus.Merged.value
        default:
            return OrderStatus.NotPaid.value
        }
    }
}


class ItemEntity {
    var title: String?
    var value: Int?
    
    init(title: String, value: Int) {
        self.title = title
        self.value = value
    }
}

enum CaculatorMode: CaseIterable {
    case day
    case overNight
    case hour
    case month
    
    static let allValues = [day.value,
                            overNight.value,
                            hour.value,
                            month.value]
    
    var value: ItemEntity {
        switch self {
        case .day:
            return ItemEntity(title: "Theo ngày", value: 1)
        case .overNight:
            return ItemEntity(title: "Qua đêm", value: 2)
        case .hour:
            return ItemEntity(title: "Theo giờ", value: 3)
        case .month:
            return ItemEntity(title: "Theo tháng", value: 4)
        }
    }
}
