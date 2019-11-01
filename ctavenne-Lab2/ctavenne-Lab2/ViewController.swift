//
//  ViewController.swift
//  ctavenne-Lab2
//
//  Created by Cody Tavenner on 2/3/19.
//  Copyright © 2019 Cody Tavenner. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var foodInput: UITextField!
    @IBOutlet weak var restInput: UITextField!
    @IBOutlet weak var searchedRest: UITextField!
    @IBOutlet weak var searchedFood: UITextField!
    @IBOutlet weak var displayRec: UILabel!
    var foodInfoDictionary:foodDictionary = foodDictionary()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    @IBAction func addFood(_ sender: UIBarButtonItem) {
        if let  rest = restInput.text, !rest.isEmpty, let food = foodInput.text, !food.isEmpty{
            // create a person record
            let fRecord =  foodRecord(r: rest, f:food)
            
            foodInfoDictionary.add(p: fRecord)
            
            // remove data from the text fields
            self.restInput.text = ""
            self.foodInput.text = ""
            
        }
        else
        {
            // Alert message will be displayed to th user if there is no input
            let alert = UIAlertController(title: "Data Input Error", message: "Data Inputs are either empty or incorrect types", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
            
        }
        
    }
    
    @IBAction func searchFood(_ sender: UIBarButtonItem) {
        let alertController = UIAlertController(title: "Search Record", message: "", preferredStyle: .alert)
        
        let serachAction = UIAlertAction(title: "Search", style: .default) { (aciton) in
            
            let text = alertController.textFields!.first!.text!
            
            if !text.isEmpty {
                let food = text
                let p =  self.foodInfoDictionary.search(s: food)
                if let x = p {
                    self.searchedRest.text = x.restaurant!
                    self.searchedFood.text = x.food
                }
                
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
        }
        
        alertController.addTextField { (textField) in
            textField.placeholder = "enter food here"
        }
        
        alertController.addAction(serachAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func deleteFood(_ sender: UIBarButtonItem) {
        let alertController = UIAlertController(title: "Delete Record", message: "", preferredStyle: .alert)
        
        let deleteAction = UIAlertAction(title: "Delete", style: .default) { (aciton) in
            
            let text = alertController.textFields!.first!.text!
            
            if !text.isEmpty {
                let food = text
                self.foodInfoDictionary.deleteRec(s: food)
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
        }
        
        alertController.addTextField { (textField) in
            textField.placeholder = "enter food here"
        }
        
        alertController.addAction(deleteAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func editRest(_ sender: UIButton) {
        if let  rest = searchedRest.text, !rest.isEmpty, let food = searchedFood.text, !food.isEmpty{
            // change a food record
            let p =  self.foodInfoDictionary.search(s: food)
            if let x = p {
                x.restaurant! = self.searchedRest.text!
                self.searchedRest.text = ""
                self.searchedFood.text = ""
            }
            
        }
        
    }
    
    var current = -1

    @IBAction func nextFood(_ sender: UIBarButtonItem) {
        
            // Alert message will be displayed to th user if there is no input
            let alert = UIAlertController(title: "Data Error", message: "No more records", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
            
        
        
    }
    
    @IBAction func prevFood(_ sender: UIBarButtonItem) {
      
        
            // Alert message will be displayed to th user if there is no input
            let alert = UIAlertController(title: "Data Error", message: "Showing the first record", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
            
        
    }
}

