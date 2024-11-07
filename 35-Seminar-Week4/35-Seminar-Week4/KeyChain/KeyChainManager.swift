//
//  KeyChainManager.swift
//  35-Seminar-Week4
//
//  Created by 최안용 on 11/6/24.
//

import UIKit
import Security

final class KeyChainManager {
    static let shared = KeyChainManager()
    
    static let tokenKey = "token"
    
    private func transformData(data: String) -> Data? {
        return data.data(using: .utf8)
    }
    
    func save(data: String, key: String) -> Bool {
        guard let saveData = transformData(data: data) else { return false }
        
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecValueData as String: saveData,
            kSecAttrService as String: key
        ]
        
        let status = SecItemAdd(query as CFDictionary, nil)
        
        switch status {
        case errSecSuccess:
            return true
            
        case errSecDuplicateItem:
            let updateQuery: [String: Any] = [
                kSecClass as String: kSecClassGenericPassword,
                kSecAttrService as String: key
            ]
            let updateAttr = [kSecValueData as String: saveData] as CFDictionary
            let status = SecItemUpdate(updateQuery as CFDictionary, updateAttr)
            return status == errSecSuccess
            
        default:
            return false
        }
    }
    
    func load(key: String) -> String? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: key,
            kSecReturnData as String: true
        ]
        
        var resultData: CFTypeRef?
        let status = SecItemCopyMatching(query as CFDictionary, &resultData)
        
        if status == errSecSuccess, let data = resultData as? Data {
            return String(data: data, encoding: .utf8)
        }
        
        return nil
    }
}
