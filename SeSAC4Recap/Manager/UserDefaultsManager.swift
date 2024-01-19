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
        case searchList
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

    var searchList: [String] {
        get {
            ud.array(forKey: UDKey.searchList.rawValue) as? [String] ?? []
        }
        set {
            ud.set(newValue, forKey: UDKey.searchList.rawValue)
        }
    }
    
    func resetList() {
        searchList.removeAll()
    }
    
}
