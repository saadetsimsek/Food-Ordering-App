//
//  ListOrdesViewController.swift
//  YemekSepeti
//
//  Created by Saadet Şimşek on 25/07/2024.
//

import UIKit

class ListOrdesViewController: UIViewController {
    

    @IBOutlet weak var tableView: UITableView!
    
    var orders: [Order] = [
        .init(id: "id", name: "saadet", dish: .init(id: "id1",
                                                    name: "Pizza",
                                                    description: "this is the best I ever tasted",
                                                    image: "https://fastly.picsum.photos/id/121/100/200.jpg?hmac=yi9c_mQa-JmlP6lWB30xXO1xIENcumVVSY_il22pcgc",
                                                    calories: 34)),
        .init(id: "id1", name: "angela", dish: .init(id: "id2",
                                                     name: "Garri",
                                                     description: "this is the best I ever tasted",
                                                     image: "https://fastly.picsum.photos/id/121/100/200.jpg?hmac=yi9c_mQa-JmlP6lWB30xXO1xIENcumVVSY_il22pcgc",
                                                     calories: 34)),
        .init(id: "id2", name: "mark", dish: .init(id: "id3",
                                                   name: "Indomie",
                                                   description: "this is the best I ever tasted",
                                                   image: "https://fastly.picsum.photos/id/121/100/200.jpg?hmac=yi9c_mQa-JmlP6lWB30xXO1xIENcumVVSY_il22pcgc",
                                                   calories: 34))
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Orders"

        tableView.delegate = self
        tableView.dataSource = self
        
        registerCells()
    }
    
    private func registerCells(){
        tableView.register(UINib(nibName: DishListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.identifier)
    }
 

}

extension ListOrdesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier, for: indexPath) as! DishListTableViewCell
        cell.setup(order: orders[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let contoller = DishDetailViewController.instantiate()
        contoller.dish = orders[indexPath.row].dish
        navigationController?.pushViewController(contoller, animated: true)
    }
}
