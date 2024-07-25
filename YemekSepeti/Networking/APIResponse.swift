//
//  APIResponse.swift
//  YemekSepeti
//
//  Created by Saadet Şimşek on 25/07/2024.
//

import Foundation

struct APIResponse<T: Decodable> : Decodable {
    
    let status: Int
    let message: String?
    let data: T?
    let error: String?
}
