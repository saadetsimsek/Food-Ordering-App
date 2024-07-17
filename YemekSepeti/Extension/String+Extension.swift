//
//  String+Extension.swift
//  YemekSepeti
//
//  Created by Saadet Şimşek on 17/07/2024.
//

import Foundation

extension String {
    var asURL: URL? {
        return URL(string: self)
    }
}
