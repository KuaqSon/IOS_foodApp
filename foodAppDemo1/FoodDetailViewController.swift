//
//  FoodDetailViewController.swift
//  foodAppDemo1
//
//  Created by Sơn Nguyễn Q. on 7/1/18.
//  Copyright © 2018 Sơn Nguyễn Q. All rights reserved.
//

import UIKit


class FoodDetailViewController: UIViewController {
    
    
    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var foodName: UILabel!
    @IBOutlet weak var foodCategory: UILabel!
    @IBOutlet weak var foodDate: UILabel!
    @IBOutlet weak var foodLocation: UILabel!
    @IBOutlet weak var foodDisc: UITextView!
    
    var food:Food?
    override func viewDidLoad() {
        super.viewDidLoad()
        foodName.text = food?.food_name!
        foodCategory.text = food?.toFoodType?.category_name
        foodImage.image = food?.image as? UIImage
        let formatter = DateFormatter()
        formatter.dateFormat =  "dd-MM-yyyy"
        foodDate.text = "Date to eat: " + formatter.string(from: (food?.date!)!)
        foodLocation.text = food?.location
        foodDisc.text = food?.discription
        self.hideKeyboardWhenTappedAround()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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
