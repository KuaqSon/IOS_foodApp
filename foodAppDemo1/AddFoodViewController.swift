//
//  AddFoodViewController.swift
//  foodAppDemo1
//
//  Created by Sơn Nguyễn Q. on 5/29/18.
//  Copyright © 2018 Sơn Nguyễn Q. All rights reserved.
//

import UIKit
import CoreData

class AddFoodViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var txtFoodName: UITextField!
    @IBOutlet weak var imageFood: UIImageView!
    
    @IBOutlet weak var txtFoodDisc: UITextView!
    @IBOutlet weak var txtFoodLocation: UITextField!
    @IBOutlet weak var pickerCategory: UIPickerView!

    @IBOutlet weak var pickerDate: UIDatePicker!
    var listCategory = [Categories]()
    var imagePicker: UIImagePickerController!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCategory()
        
        pickerCategory.delegate = self
        pickerCategory.dataSource = self
    
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        self.hideKeyboardWhenTappedAround()

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
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return listCategory.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let categories = listCategory[row]
        return categories.category_name
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
    
    @IBAction func buSave(_ sender: Any) {
        let newFood = Food(context: context)
        newFood.food_name = txtFoodName.text
        newFood.location = txtFoodLocation.text
        newFood.date = pickerDate.date
        newFood.image = imageFood.image
        newFood.discription = txtFoodDisc.text
        newFood.toFoodType = listCategory[ pickerCategory.selectedRow(inComponent: 0)]
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



