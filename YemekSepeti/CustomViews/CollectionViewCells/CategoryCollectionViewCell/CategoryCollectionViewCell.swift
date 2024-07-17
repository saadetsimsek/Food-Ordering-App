//
//  CategoryCollectionViewCell.swift
//  YemekSepeti
//
//  Created by Saadet Şimşek on 16/07/2024.
//

import UIKit
import Kingfisher

class CategoryCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CategoryCollectionViewCell"
    
    @IBOutlet weak var categoryImageView: UIImageView!
    
    @IBOutlet weak var categoryLabel: UILabel!
    
    func setup(category: DishCategory) {
        categoryLabel.text = category.name
        categoryImageView.kf.setImage(with: category.image.asURL)
    }
  

}
