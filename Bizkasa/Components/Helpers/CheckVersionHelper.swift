//
//  VersionCheck.swift
//  TaskManagement
//
//  Created by Nguyen Binh An on 4/1/19.
//  Copyright © 2019 Thang Nguyen. All rights reserved.
//

import UIKit
import Alamofire

struct VersionValue: Equatable {
    let value: String
    static func == (lhs: VersionValue, rhs: VersionValue) -> Bool {
        var tablelhs = lhs.value.splitted(by: ".")
        var tablerhs = rhs.value.splitted(by: ".")
        if tablelhs.count < tablerhs.count {
            tablelhs.append("0")
        }
        if tablelhs.count > tablerhs.count {
            tablerhs.append("0")
        }
        for (index,item) in tablelhs.enumerated() {
            if item != tablerhs[index] {
                return false
            }
        }
        return true
    }
    
    static func > (lhs: VersionValue, rhs: VersionValue) -> Bool {
        var tablelhs = lhs.value.splitted(by: ".")
        var tablerhs = rhs.value.splitted(by: ".")
        if tablelhs.count < tablerhs.count {
            tablelhs.append("0")
        }
        if tablelhs.count > tablerhs.count {
            tablerhs.append("0")
        }
        for (index,item) in tablelhs.enumerated() {
            let lhsValue = Int(item) ?? 0
            let rhsValue = Int(tablerhs[index]) ?? 0
            if lhsValue > rhsValue {
                return true
            } else if lhsValue < rhsValue {
                return false
            }
        }
        return false
    }
}

class CheckVersionHelper {
    
    public static let shared = CheckVersionHelper()
    
    var newVersionAvailable: Bool?
    var appStoreVersion: String?
    
    func checkAppStore(callback: ((_ versionAvailable: Bool?, _ version: String?)->Void)? = nil) {
        let ourBundleId = Bundle.main.infoDictionary!["CFBundleIdentifier"] as! String
        Alamofire.request("https://itunes.apple.com/lookup?bundleId=\(ourBundleId)&country=vn").responseJSON { response in

            var isNew: Bool?
            var versionStr: String?
            
            if let json = response.result.value as? NSDictionary,
                let results = json["results"] as? NSArray,
                let entry = results.firstObject as? NSDictionary
            {
                let appVersion = VersionValue(value: entry["version"] as? String ?? "0")
                let ourVersion = VersionValue(value: Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "0")
                isNew =  appVersion > ourVersion
                versionStr = appVersion.value
            }
            
            self.appStoreVersion = versionStr
            self.newVersionAvailable = isNew
            callback?(isNew, versionStr)
        }
    }
}
