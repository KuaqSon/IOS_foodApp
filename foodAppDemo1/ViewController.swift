//
//  ViewController.swift
//  foodAppDemo1
//
//  Created by Sơn Nguyễn Q. on 5/28/18.
//  Copyright © 2018 Sơn Nguyễn Q. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    
    @IBOutlet weak var txtCategoryName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buAddCategory(_ sender: Any) {
        //add action
        let newCategory = Categories(context: context)
        newCategory.category_name = txtCategoryName.text
        do {
            try ad.saveContext()
            txtCategoryName.text = ""
        }catch{
            print("cannot save record")
        }
    }
    
    @IBAction func buBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

