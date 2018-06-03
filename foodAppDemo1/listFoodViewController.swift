//
//  listFoodViewController.swift
//  foodAppDemo1
//
//  Created by Sơn Nguyễn Q. on 5/29/18.
//  Copyright © 2018 Sơn Nguyễn Q. All rights reserved.
//

import UIKit
import CoreData

class listFoodViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableViewListFood: UITableView!
    
    var listOfFood = [Food]()
    override func viewDidLoad() {
        super.viewDidLoad()
        loadFood()
        tableViewListFood.delegate = self
        tableViewListFood.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    
    func loadFood() {
        let fetchRequest: NSFetchRequest<Food> = Food.fetchRequest()
        do {
            listOfFood = try context.fetch(fetchRequest)
        }catch {
            print("cannot load food")
        }
    }

    // table
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfFood.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "foodCell", for: indexPath) as! FoodTableViewCell
        cell.setFood(food: listOfFood[indexPath.row])
        return cell
    }
    

}
