//
//  UserDefaults+Extension.swift
//  YemekSepeti
//
//  Created by Saadet Şimşek on 28/07/2024.
//

import Foundation

extension UserDefaults {
    
    private enum UserDefaultsKey: String {
        case hasOnboarded
    }
    
    var hasOnboarded: Bool {
        get{
            bool(forKey: UserDefaultsKey.hasOnboarded.rawValue)
        }
        set{
            setValue(newValue, forKey: UserDefaultsKey.hasOnboarded.rawValue)
        }
    }
}
