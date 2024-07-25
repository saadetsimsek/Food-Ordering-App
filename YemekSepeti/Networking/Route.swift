//
//  Route.swift
//  YemekSepeti
//
//  Created by Saadet Şimşek on 25/07/2024.
//

import Foundation

enum Route {
    static let baseUrl = "https://yummie.glitch.me"
       
       case temp
       
       var description: String {
           switch self {
           case .temp:
               return "/temp"
           }
       }
}
