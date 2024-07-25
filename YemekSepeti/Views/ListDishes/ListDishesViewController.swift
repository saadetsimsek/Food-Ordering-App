//
//  ListDishesViewController.swift
//  YemekSepeti
//
//  Created by Saadet Şimşek on 25/07/2024.
//

import UIKit

class ListDishesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var category: DishCategory!
    
    var dishes: [Dish] = [
        .init(id: "id1", name: "Garri", description: "this is the best I ever tasted", image: "https://fastly.picsum.photos/id/121/100/200.jpg?hmac=yi9c_mQa-JmlP6lWB30xXO1xIENcumVVSY_il22pcgc", calories: 34),
        .init(id: "id2", name: "Indomie", description: "this is the best I ever tasted this is the best I ever tasted this is the best I ever tasted this is the best I ever tasted this is the best I ever tasted this is the best I ever tasted this is the best I ever tasted this is the best I ever tasted this is the best I ever tasted", image: "https://fastly.picsum.photos/id/121/100/200.jpg?hmac=yi9c_mQa-JmlP6lWB30xXO1xIENcumVVSY_il22pcgc", calories: 314),
        .init(id: "id3", name: "Pizza", description: "this is the best I ever tasted", image: "https://fastly.picsum.photos/id/121/100/200.jpg?hmac=yi9c_mQa-JmlP6lWB30xXO1xIENcumVVSY_il22pcgc", calories: 1320),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        title = category.name
        
        registerCells()
    }
    
    private func registerCells(){
        tableView.register(UINib(nibName: DishListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.identifier)
    }
    



}

extension ListDishesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dishes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier, for: indexPath) as! DishListTableViewCell
        cell.setup(dish: dishes[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let controller = DishDetailViewController.instantiate()
        controller.dish = dishes[indexPath.row]
        navigationController?.pushViewController(controller, animated: true)
    }
}
