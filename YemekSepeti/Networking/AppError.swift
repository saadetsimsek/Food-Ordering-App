//
//  AppError.swift
//  YemekSepeti
//
//  Created by Saadet Şimşek on 25/07/2024.
//

import Foundation

enum AppError: LocalizedError {
    case errorDecoding
    case unknonError
    case invalidUrl
    case serverError(String)
    
    var errorDescription: String? {
        switch self {
        case .errorDecoding:
            return "Response could not be decoded"
        case .unknonError:
            return "Bruhhh! I have no idea what go on"
        case .invalidUrl:
            return "Heyy! give a valid URL!"
        case .serverError(let error):
            return error
        }
    }
}
