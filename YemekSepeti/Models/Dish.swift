//
//  Dish.swift
//  YemekSepeti
//
//  Created by Saadet Şimşek on 18/07/2024.
//

import Foundation

struct Dish: Decodable {
    let id: String?
    let name: String?
    let description: String?
    let image: String?
    let calories: Int?
    
    var formattedCalories: String {
        return "\(calories ?? 0) calories"
    }
}
