//
//  WKWebView+Extension.swift
//  DXG E-Office
//
//  Created by Macintosh HD on 2/4/20.
//  Copyright © 2020 DINH VAN TIEN. All rights reserved.
//

import Foundation
import WebKit
import Alamofire

extension WKWebView {

    private var httpCookieStore: WKHTTPCookieStore  { return WKWebsiteDataStore.default().httpCookieStore }

    func getCookies(for domain: String? = nil, completion: @escaping ([String : Any], _ isLogin:Bool )->())  {
        var cookieDict = [String : AnyObject]()
        httpCookieStore.getAllCookies { cookies in
            
            var isCookie = false
            
            for cookie in cookies {
                if cookie.name.contains("FedAuth") {
                    isCookie = true
                }
            }
            
            for cookie in cookies {
                if let domain = domain {
                    if cookie.domain.contains(domain) {
                        cookieDict[cookie.name] = cookie.properties as AnyObject?
                    }
                } else {
                    cookieDict[cookie.name] = cookie.properties as AnyObject?
                }
                
                if isCookie {
                    let manager = Alamofire.SessionManager.default
                    manager.session.configuration.httpCookieStorage?.setCookie(cookie)
                }
            }
            completion(cookieDict, isCookie)
        }
    }
    
    func cleanAllCookies() {
        HTTPCookieStorage.shared.removeCookies(since: Date.distantPast)
        print("All cookies deleted")

        WKWebsiteDataStore.default().fetchDataRecords(ofTypes: WKWebsiteDataStore.allWebsiteDataTypes()) { records in
            records.forEach { record in
                WKWebsiteDataStore.default().removeData(ofTypes: record.dataTypes, for: [record], completionHandler: {})
                print("Cookie ::: \(record) deleted")
            }
        }
    }

    func refreshCookies() {
        self.configuration.processPool = WKProcessPool()
    }
}
