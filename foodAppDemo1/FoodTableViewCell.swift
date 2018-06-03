//
//  FoodTableViewCell.swift
//  foodAppDemo1
//
//  Created by Sơn Nguyễn Q. on 5/29/18.
//  Copyright © 2018 Sơn Nguyễn Q. All rights reserved.
//

import UIKit

class FoodTableViewCell: UITableViewCell {

    @IBOutlet weak var imageFoodView: UIImageView!
    @IBOutlet weak var laFoodName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setFood(food: Food) {
        laFoodName.text = food.food_name
        imageFoodView.image = food.image as? UIImage
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
