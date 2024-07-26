//
//  HomeViewController.swift
//  YemekSepeti
//
//  Created by Saadet Şimşek on 15/07/2024.
//

import UIKit
import ProgressHUD

class HomeViewController: UIViewController {
    
    var categories: [DishCategory] = []
    
    var populars: [Dish] = []
    
    var specials: [Dish] = []
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    @IBOutlet weak var popularCollectionView: UICollectionView!
   
    @IBOutlet weak var specialsCollectionView: UICollectionView!
 
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Yemek Sepeti"
        
  /*      NetworkService.shared.myFirstRequest { results in
            switch results {
            case .success(let data):
                for dish in data{
                    print(dish.name ?? "")
                }
             //   print("The decoded date is: \(data)")
            case .failure(let error):
                print("The error is: \(error.localizedDescription)")
            }
        }
     */
        
        delegateCalls()
        
        registerCells()
        
        ProgressHUD.progress("Loading" , 0.42)
        NetworkService.shared.fetchAllCategories {[weak self] results in
            switch results {
            case .success(let dishes):
                ProgressHUD.dismiss()
                self?.categories = dishes.categories ?? []
                self?.populars = dishes.populars ?? []
                self?.specials = dishes.specials ?? []
                
                DispatchQueue.main.async {
                    self?.categoryCollectionView.reloadData()
                    self?.popularCollectionView.reloadData()
                    self?.specialsCollectionView.reloadData()
                }
            case .failure(let error):
                ProgressHUD.error(error.localizedDescription)
            }
        }
    }
    
    private func delegateCalls(){
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        
        popularCollectionView.delegate = self
        popularCollectionView.dataSource = self
        
        specialsCollectionView.delegate = self
        specialsCollectionView.dataSource = self
    }
    
    
    private func registerCells(){
        categoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifier,
                                              bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        
        popularCollectionView.register(UINib(nibName: DishPortraitCollectionViewCell.identifier,
                                             bundle: nil), forCellWithReuseIdentifier: DishPortraitCollectionViewCell.identifier)
        
        specialsCollectionView.register(UINib(nibName: DishLandscapeCollectionViewCell.identifier, 
                                              bundle: nil), forCellWithReuseIdentifier: DishLandscapeCollectionViewCell.identifier)

    }

}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView{
            
        case categoryCollectionView:
            return categories.count
        case popularCollectionView:
            return populars.count
        case specialsCollectionView:
            return specials.count
        default:
            return 0
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView{
        case categoryCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
            cell.setup(category: categories[indexPath.row])
            return cell
            
        case popularCollectionView:
            print("huy")
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishPortraitCollectionViewCell.identifier, for: indexPath) as! DishPortraitCollectionViewCell
            cell.setup(dish: populars[indexPath.row])
            return cell
            
        case specialsCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishLandscapeCollectionViewCell.identifier, for: indexPath) as! DishLandscapeCollectionViewCell
            cell.setup(dish: specials[indexPath.row])
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
  //      collectionView.deselectItem(at: indexPath, animated: true)
        
        if collectionView == categoryCollectionView {
            let controller = ListDishesViewController.instantiate()
            controller.category = categories[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
        }
        else{
            let controller = DishDetailViewController.instantiate()
            controller.dish = collectionView == popularCollectionView
            ? populars[indexPath.row] : specials[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
        }
    }
}
