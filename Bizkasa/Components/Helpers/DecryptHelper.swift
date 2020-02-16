//
//  AppDecryptHelper.swift
//  DXG E-Office
//
//  Created by DINH VAN TIEN on 11/28/19.
//  Copyright © 2019 DINH VAN TIEN. All rights reserved.
//

import Foundation
import CryptoSwift

class DecryptHelper {
    static let shared = DecryptHelper()
    
    func encryptAES(text: String) -> String {
        
        var result = ""
        let iv: String = "1234567890123456"
        do {
            let key: String = UserDefaults.standard.string(forKey: AppKey.decryptKey) ?? "SureP0rt@l!@2017"
            
            let aes = try! AES(key: key, iv: iv, blockMode: .CBC, padding: .pkcs7)
            
            let encrypted = try aes.encrypt(Array(text.utf8))
            
            result = encrypted.toHexString()
            
        } catch {
            
            print("Error: \(error)")
        }
        
        return result
    }
    
    
    func decryptAES(cleanText: String) -> String? {
        //    let key: String = "SureP0rt@l!@2017"
        let iv: String = "1234567890123456"
        do {
            let key: String = UserDefaults.standard.string(forKey: AppKey.decryptKey) ?? "SureP0rt@l!@2017"
            if let encryptedBytes = cleanText.stringToBytes() {
                let aes = try AES(key: Array(key.utf8), iv: Array(iv.utf8), blockMode: .CBC, padding: .pkcs7)
                let plainText = try encryptedBytes.decrypt(cipher: aes)
                return String(bytes: plainText, encoding: .utf8)
            }
        } catch {
            debugPrint("SPCrypto.decryptAES.error : \(error)")
        }
        return nil
    }
}
