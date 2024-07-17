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
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Yemek Sepeti"
        
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        
        registerCells()
    }
    
    private func registerCells(){
        categoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifier,
                                              bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
    }

}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
        cell.setup(category: categories[indexPath.row])
        return cell
    }
}
