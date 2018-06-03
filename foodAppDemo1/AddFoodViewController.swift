//
//  AddFoodViewController.swift
//  foodAppDemo1
//
//  Created by Sơn Nguyễn Q. on 5/29/18.
//  Copyright © 2018 Sơn Nguyễn Q. All rights reserved.
//

import UIKit
import CoreData

class AddFoodViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var txtFoodName: UITextField!
    @IBOutlet weak var imageFood: UIImageView!
    
    @IBOutlet weak var tblDropDown: UITableView!
    @IBOutlet weak var tblDropDownHC: NSLayoutConstraint!
    @IBOutlet weak var btnSelectCategory: UIButton!
    
    var isTableVisible = false
    
    var listCategory = [Categories]()
    var imagePicker: UIImagePickerController!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCategory()
        
        tblDropDown.delegate = self
        tblDropDown.dataSource = self
        tblDropDownHC.constant = 0
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self

        // Do any additional setup after loading the view.
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
    

    
    @IBAction func buSelectImage(_ sender: Any) {
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageFood.image = image
        }
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    
    // table cagetory
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listCategory.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "selectCategory")
        if cell == nil {
            cell == UITableViewCell(style: .default, reuseIdentifier: "selectCategory")
        }
        let category = listCategory[indexPath.row] as Categories
        cell?.textLabel?.text = category.category_name?.uppercased()
        return cell!
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let category = listCategory[indexPath.row] as Categories
        btnSelectCategory.setTitle(category.category_name?.uppercased(), for: .normal)
        UIView.animate(withDuration: 0.5) {
            self.tblDropDownHC.constant = 0
            self.isTableVisible = false
            self.view.layoutIfNeeded()
        }
    }
    
    
    @IBAction func bttSelectCategory(_ sender: AnyObject) {
        UIView.animate(withDuration: 0.5) {
            if self.isTableVisible == false {
                self.isTableVisible == true
                self.tblDropDownHC.constant = 44.0 * 3.0
            } else {
                self.tblDropDownHC.constant = 0
                self.isTableVisible = false
            }
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func buSave(_ sender: Any) {
        let newFood = Food(context: context)
        newFood.food_name = txtFoodName.text
        newFood.date_add = NSDate() as? Date
        newFood.image = imageFood.image
        newFood.toFoodType? = listCategory[1]
        do {
            try ad.saveContext()
            txtFoodName.text = ""
        }catch {
            print("cannot save food")
        }
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
