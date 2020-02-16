//
//  EnumSearch.swift
//  DXG E-Office
//
//  Created by DINH VAN TIEN on 1/7/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//

import Foundation
import UIKit

class AdvanceSearchScope {
    var name: String?
    var code: String?

    init(name: String?, code: String?) {
        self.name = name
        self.code = code
    }
}

extension AdvanceSearchScope: Equatable {
    static func == (lhs: AdvanceSearchScope, rhs: AdvanceSearchScope) -> Bool {
        return
            lhs.code& == rhs.code&
    }
}

enum SearchScope {
    case all
    case project
    case task
}

extension SearchScope : RawRepresentable {
    typealias RawValue = AdvanceSearchScope

    init?(rawValue: RawValue) {
        switch rawValue {
        case AdvanceSearchScope(name: "TẤT CẢ", code: "All"):
            self = .all
        case AdvanceSearchScope(name: "DỰ ÁN", code: "Project"):
            self = .project
        case AdvanceSearchScope(name: "CÔNG VIỆC", code: "Task"):
            self = .task
        default:
            return nil
        }
    }

    var rawValue: AdvanceSearchScope {
         switch self {
         case .all:
            return AdvanceSearchScope(name: "TẤT CẢ", code: "All")
         case .project:
            return AdvanceSearchScope(name: "DỰ ÁN", code: "Project")
         case .task:
            return AdvanceSearchScope(name: "CÔNG VIỆC", code: "Task")
        }
    }
}

//--- ROLE IN TASK

enum RolesInTask {
    case process
    case collaborate
    case acknowledge

    var title: String {
        switch self {
        case .process:
            return "CHỦ TRÌ"
        case .collaborate:
            return "PHỐI HỢP"
        case .acknowledge:
            return "THEO DÕI"
        }
    }
}

extension RolesInTask : RawRepresentable {
    typealias RawValue = RolesTask

    init?(rawValue: RawValue) {
        switch rawValue {
        case RolesTask(name: "CHỦ TRÌ", code: 1):
            self = .process
        case RolesTask(name: "PHỐI HỢP", code: 3):
            self = .collaborate
        case RolesTask(name: "THEO DÕI", code: 7):
            self = .acknowledge
        default:
            return nil
        }
    }

    var rawValue: RolesTask {
         switch self {
         case .process:
            return RolesTask(name: "XỬ LÝ", code: 1)
         case .collaborate:
            return RolesTask(name: "PHỐI HỢP", code: 3)
         case .acknowledge:
            return RolesTask(name: "ĐỂ BIẾT", code: 7)
        }
    }
}

class RolesTask {
    var name: String?
    var code: Int?
    var indexSelected: Int = 0

    init(name: String?, code: Int?) {
        self.name = name
        self.code = code
    }
}

extension RolesTask: Equatable {
    static func == (lhs: RolesTask, rhs: RolesTask) -> Bool {
        return lhs.code* == rhs.code*
    }
}

