//
//  listCategoryTableViewController.swift
//  foodAppDemo1
//
//  Created by Sơn Nguyễn Q. on 6/3/18.
//  Copyright © 2018 Sơn Nguyễn Q. All rights reserved.
//

import UIKit
import CoreData

class listCategoryTableViewController: UITableViewController {

    var listCategory = [Categories]()
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCategory()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func loadCategory() {
        let fetchRequest: NSFetchRequest<Categories> = Categories.fetchRequest()
        do {
            listCategory = try context.fetch(fetchRequest)
        }catch {
            print("cannot load category")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listCategory.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath)

        let category = listCategory[indexPath.row] as Categories
        cell.textLabel?.text = category.category_name?.uppercased()
        cell.textLabel?.textAlignment = NSTextAlignment.center

        return cell
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let category = listCategory[indexPath.row]
            listCategory.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            context.delete(category)
            do {
                try ad.saveContext()
            }catch {
                print("cannot save record")
            }
        }
    }
 



}
