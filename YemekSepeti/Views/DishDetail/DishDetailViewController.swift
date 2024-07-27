//
//  DishDetailViewController.swift
//  YemekSepeti
//
//  Created by Saadet Şimşek on 23/07/2024.
//

import UIKit
import ProgressHUD

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
        guard let name = nameField.text?.trimmingCharacters(in: .whitespaces), !name.isEmpty
        else{
            ProgressHUD.error("Please enter your name!")
            return
        }
      //  print("Hello, \(name)")
        
        ProgressHUD.progress("Placing Order...", 0.99 )
        NetworkService.shared.placeOrder(dishID: dish.id ?? "",
                                         name: name) { [weak self] result in
            switch result {
            case .success(let order):
                ProgressHUD.succeed("Your order has been received.")
            case .failure(let error):
                ProgressHUD.error(error.localizedDescription)
            }
        }
    }
    
  
    private func populateView(){
        dishImageView.kf.setImage(with: dish.image?.asURL)
        dishTitleLabel.text = dish.name
        descriptionLabel.text = dish.description
        caloriesLabel.text = dish.formattedCalories
    }

}
