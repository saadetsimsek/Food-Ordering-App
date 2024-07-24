//
//  DishDetailViewController.swift
//  YemekSepeti
//
//  Created by Saadet Şimşek on 23/07/2024.
//

import UIKit

class DishDetailViewController: UIViewController {
    
    var dish: Dish!
    
    @IBOutlet weak var dishImageView: UIImageView!
    
    @IBOutlet weak var dishTitleLabel: UILabel!
    
    @IBOutlet weak var caloriesLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var nameField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        populateView()
        
    }
    
    @IBAction func placeOrderButtonClicked(_ sender: Any) {
    }
    
  
    private func populateView(){
        dishImageView.kf.setImage(with: dish.image?.asURL)
        dishTitleLabel.text = dish.name
        descriptionLabel.text = dish.description
        caloriesLabel.text = dish.formattedCalories
    }

}
