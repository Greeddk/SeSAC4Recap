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
        case userImage
        case searchList
        case searchKeyword
        case userState
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

    var userImage: String {
        get {
            ud.string(forKey: UDKey.userImage.rawValue) ?? "profile1"
        }
        set {
            ud.set(newValue, forKey: UDKey.userImage.rawValue)
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
    
    var searchKeyword: String {
        get {
            ud.string(forKey: UDKey.searchKeyword.rawValue) ?? ""
        }
        set {
            ud.set(newValue, forKey: UDKey.searchKeyword.rawValue)
        }
    }
    
    var userState: Bool {
        get {
            ud.bool(forKey: UDKey.userState.rawValue)
        }
        set {
            ud.set(newValue, forKey: UDKey.userState.rawValue)
        }
    }

    
}
