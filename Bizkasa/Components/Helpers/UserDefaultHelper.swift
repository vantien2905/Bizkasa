//
//  UserUtils.swift
//  Vebrary
//
//  Created by DINH VAN TIEN on 5/7/19.
//  Copyright © 2019 DINH VAN TIEN. All rights reserved.
//

import UIKit
import ObjectMapper

class UserDefaultHelper: NSObject {

    static let shared = UserDefaultHelper()

    let userDefaultManager = UserDefaults.standard

    func clearDataUser() {
        userDefaultManager.removeObject(forKey: AppKey.userData)
        userDefaultManager.removeObject(forKey: AppKey.authenticatedUserDepartment)
        userDefaultManager.removeObject(forKey: AppKey.indexDepartment)
        userDefaultManager.removeObject(forKey: AppKey.CalendarType)
    }

    func save(_ value: Any?, key: String) {
        userDefaultManager.set(value, forKey: key)
    }

    func remove(key: String) {
        userDefaultManager.removeObject(forKey: key)
    }

    func get(key: String) -> String? {
        return userDefaultManager.value(forKey: key) as? String
    }

    func getDomain() -> String? {
        return userDefaultManager.value(forKey: AppKey.domain) as? String
    }

    func getDate(key: String) -> Date {
        guard let date = userDefaultManager.value(forKey: key) as? Date else {
            return Date()
        }
        return date
    }

    func checkSaveDomain() -> Bool {
        if let tokent = userDefaultManager.value(forKey: AppKey.domain) as? String {
            return !tokent.isEmpty
        } else {
            return false
        }
    }

    func checkLogin() -> Bool {
        if let customerId = userDefaultManager.value(forKey: AppKey.userData) as? NSData {
            return !customerId.isEmpty
        } else {
            return false
        }
    }
}
