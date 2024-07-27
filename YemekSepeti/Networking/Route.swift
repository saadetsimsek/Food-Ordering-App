//
//  Route.swift
//  YemekSepeti
//
//  Created by Saadet Şimşek on 25/07/2024.
//

import Foundation

enum Route {
    static let baseUrl = "https://yummie.glitch.me"
       
    case fetchAllCategories
    case placeOrder(String)
       
       var description: String {
           switch self {
           case .fetchAllCategories:
               return "/dish-categories"
           case .placeOrder(let dishID):
               return "/orders/\(dishID)"
           }
       }
}
