//
//  AllDishes.swift
//  YemekSepeti
//
//  Created by Saadet Şimşek on 26/07/2024.
//

import Foundation

struct AllDishes: Decodable{
    let categories: [DishCategory]?
    let populars: [Dish]?
    let specials: [Dish]?
}
