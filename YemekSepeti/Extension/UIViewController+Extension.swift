//
//  UIViewController+Extension.swift
//  YemekSepeti
//
//  Created by Saadet Şimşek on 25/07/2024.
//

import Foundation
import UIKit

extension UIViewController {
    
    static var identifier : String {
        return String(describing: self)
    }
    
    static func instantiate() -> Self {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: identifier) as! Self
        return controller
    }
}
