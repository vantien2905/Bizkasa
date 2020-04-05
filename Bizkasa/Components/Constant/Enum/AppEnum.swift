//
//  Enum.swift
//  Vebrary
//
//  Created by DINH VAN TIEN on 5/28/19.
//  Copyright © 2019 DINH VAN TIEN. All rights reserved.
//

import UIKit


enum CaculatorMode: Int {
    case day = 1
    case overNight = 2
    case hour = 3
    case month = 4
}

enum CalendarDetailType: String {
    case personal = "CÁ NHÂN"
    case department = "PHÒNG BAN"
}

enum DetailKind {
    case ReadOnly
    case Editable
    case AddNew
}

enum CalendarType: String {
    case oneDay = "Hôm nay"
    case threeDay = "3 ngày"
    case oneWeek = "1 tuần"
    case oneMonth = "Tháng"
}

enum TypeDocument: String {
    case digitaldocument
    case serialonline
    case article
}

enum TypeSearch {
    case SearchPage
    case SearchDigital
    case SearchNews
    case SearchArticle
}

enum BookStatus: String {
    case AmountCheckout
    case AmountReserve
    case AmountRecall
    case AmountHold
}

enum ActiveModuleName: String {
    case Document
    case Task
    case BusinessWorkflow
    case TimeSheet
    case BusinessTripRequest
    case Vehicle
    case MeetingRoom
    case Stationery
    case DocumentLibrary
    case HelpDesk
    case Announcement
    case Schedule
    case TK
}

enum ModuleCodeName: String {
    case Document               = "Văn bản"
    case Task                   = "Công việc"
    case BusinessWorkflow       = "Quy trình số"
    case TimeSheet              = "Nghỉ phép"
    case BusinessTripRequest    = "Công tác"
    case Vehicle                = "Đăng ký xe"
    case MeetingRoom            = "Phòng họp"
    case Stationery             = "Văn phòng phẩm"
    case DocumentLibrary        = "Thư viện tài liệu"
    case HelpDesk               = "Hỗ trợ helpdesk"
    case Announcement
    case Schedule               = "Lịch làm việc"
    case TK                     = "Trang chủ"

}

enum TaskEnum: CaseIterable {
    case assign
    case process
    case approveReturn
    case appraise
    case sendMail
    case appraiseExtend
    
    static let allValues = [assign, process, approveReturn, appraise, appraiseExtend]
    
    var code: String {
        switch self {
        case .assign:
            return "Assign"
        case .process:
            return "Process"
            
        case .approveReturn:
            return "ApproveReturn"
        case .appraise:
            return "Appraise"
        case .sendMail:
            return "SendMail"
        case .appraiseExtend:
            return "AppraiseExtend"
        }
    }
    
    var name: String {
        switch self {
        case .assign:
            return "Giao việc"
        case .process:
            return "Xử lý"
            
        case .approveReturn:
            return "Duyệt trả lại"
        case .appraise:
            return "Đánh giá"
        case .sendMail:
            return "Gửi mail"
        case .appraiseExtend:
            return "Duyệt gia hạn"
        }
    }
    
    var img: String {
        switch self {
        case .assign:
            return "Assign"
        case .process:
            return "Process"
            
        case .approveReturn:
            return "Approve_return"
        case .appraise:
            return "Appraise"
        case .sendMail:
            return "Sendmail"
        case .appraiseExtend:
            return "Appraise"
        }
    }
    
    
}

enum TaskType {
    case owner
    case collaborate
    case known
    
    var value: Int {
        switch self {
        case .owner:
            return 1
        case .collaborate:
            return 3
        case .known:
            return 7
        default:
            break
        }
    }
    
    var name: String {
        switch self {
        case .owner:
            return "Chủ trì"
        case .collaborate:
            return "Phối hợp"
        case .known:
            return "Để biết"
        default:
            break
        }
    }
    
    var color: UIColor {
        switch self {
        case .owner:
            return UIColor(hexString: "#1c8ff2")
        case .collaborate:
            return UIColor(hexString: "#efa500")
        case .known:
           return UIColor(hexString: "#BABABA")
        default:
            break
        }
    }
}

enum ColorEnum {
    case red
    case blue
    
    var color:String{
        switch self {
        case .red:
            return "red"
        case .blue:
            return "blue"
        default:
            break
        }
    }
    
    var colorHex:String{
        switch self {
        case .red:
            return "#FF0000"
        case .blue:
            return "0000FF"
        default:
            break
        }
    }
}

enum ProcessTaskEnum:Int {
    case new
    case process
    case report
    case cancel
    case finish
    case renewal
    case report_return
    case edit_task
    case viewed
    
    static let allValues = [new, process, report, cancel, finish]
    
    var value: Int {
        switch self {
        case .new:
            return 0
        case .process:
            return 1
        case .report:
            return 2
        case .cancel:
            return 3
        case .finish:
            return 4
        case .renewal:
            return 5
        case .report_return:
            return 6
        case .edit_task:
            return 7
        case .viewed:
            return 8
        default:
            break
        }
    }
}
