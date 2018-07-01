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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "foodDetail", sender: listOfFood[indexPath.row])
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "foodDetail" {
            if let dis = segue.destination as? FoodDetailViewController {
                if let food = sender as? Food {
                    dis.food = food
                }
            }
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
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else {
            return
        }
        //tableView.deleteRows(at: [indexPath], with: .automatic)
        //listOfFood.remove(at: indexPath.row)
        //loadFood()
        
    }
    

}
