//
//  UIView+Extension.swift
//  YemekSepeti
//
//  Created by Saadet Şimşek on 11/07/2024.
//

import Foundation
import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat { // sınıfın köşe çapını Interface Builder'da(xcode arayüz düzenleyicisinde) kolayca düzenlenebilir hale getirebilmek için
        get { return cornerRadius }
        set {
            self.layer.cornerRadius = newValue
        }
    }
}
