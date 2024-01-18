//
//  UserDefaultManager.swift
//  SeSAC4Recap
//
//  Created by Greed on 1/18/24.
//

import Foundation

class UserDefaultsManager {
    
    static let shared = UserDefaultsManager()
    
    enum UDKey: String {
        case nickname
    }
    
    let ud = UserDefaults.standard
    
    var nickname: String {
        get {
            ud.string(forKey: UDKey.nickname.rawValue) ?? ""
        }
        set {
            ud.set(newValue, forKey: UDKey.nickname.rawValue)
        }
    }
    
}
