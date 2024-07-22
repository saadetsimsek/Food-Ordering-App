//
//  HomeViewController.swift
//  YemekSepeti
//
//  Created by Saadet Şimşek on 15/07/2024.
//

import UIKit

class HomeViewController: UIViewController {
    
    var categories: [DishCategory] = [
        .init(id: "id1", name: "Africa Dish 1", image: "https://fastly.picsum.photos/id/121/100/200.jpg?hmac=yi9c_mQa-JmlP6lWB30xXO1xIENcumVVSY_il22pcgc"),
        .init(id: "id2", name: "Africa Dish 2", image: "https://fastly.picsum.photos/id/121/100/200.jpg?hmac=yi9c_mQa-JmlP6lWB30xXO1xIENcumVVSY_il22pcgc"),
        .init(id: "id3", name: "Africa Dish 3", image: "https://fastly.picsum.photos/id/121/100/200.jpg?hmac=yi9c_mQa-JmlP6lWB30xXO1xIENcumVVSY_il22pcgc"),
        .init(id: "id4", name: "Africa Dish 4", image: "https://fastly.picsum.photos/id/121/100/200.jpg?hmac=yi9c_mQa-JmlP6lWB30xXO1xIENcumVVSY_il22pcgc"),
        .init(id: "id5", name: "Africa Dish 5", image: "https://fastly.picsum.photos/id/121/100/200.jpg?hmac=yi9c_mQa-JmlP6lWB30xXO1xIENcumVVSY_il22pcgc"),
    ]
    
    var populars: [Dish] = [
        .init(id: "id1", name: "Garri", description: "this is the best I ever tasted", image: "https://fastly.picsum.photos/id/121/100/200.jpg?hmac=yi9c_mQa-JmlP6lWB30xXO1xIENcumVVSY_il22pcgc", calories: 34),
        .init(id: "id2", name: "Indomie", description: "this is the best I ever tasted", image: "https://fastly.picsum.photos/id/121/100/200.jpg?hmac=yi9c_mQa-JmlP6lWB30xXO1xIENcumVVSY_il22pcgc", calories: 314),
        .init(id: "id3", name: "Pizza", description: "this is the best I ever tasted", image: "https://fastly.picsum.photos/id/121/100/200.jpg?hmac=yi9c_mQa-JmlP6lWB30xXO1xIENcumVVSY_il22pcgc", calories: 1320),
    ]
    
    var specials: [Dish] = [
        .init(id: "id1", name: "Fried Plantain", description: "this is my favorite dish", image: "https://fastly.picsum.photos/id/121/100/200.jpg?hmac=yi9c_mQa-JmlP6lWB30xXO1xIENcumVVSY_il22pcgc", calories: 34),
        .init(id: "id2", name: "Beans", description: "this is the best I ever tasted", image: "https://fastly.picsum.photos/id/121/100/200.jpg?hmac=yi9c_mQa-JmlP6lWB30xXO1xIENcumVVSY_il22pcgc", calories: 314),
        .init(id: "id3", name: "Pizza", description: "this is the best I ever tasted", image: "https://fastly.picsum.photos/id/121/100/200.jpg?hmac=yi9c_mQa-JmlP6lWB30xXO1xIENcumVVSY_il22pcgc", calories: 1320),
    ]
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    @IBOutlet weak var popularCollectionView: UICollectionView!
   
    @IBOutlet weak var specialsCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Yemek Sepeti"
        
        delegateCalls()
        
        registerCells()
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
}
