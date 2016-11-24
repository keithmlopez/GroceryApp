//
//  GroceryItemViewController.swift
//  GroceryApp
//
//  Created by Keith and Marshneille Lopez on 11/23/16.
//  Copyright © 2016 icc. All rights reserved.
//

import UIKit

class GroceryItemViewController: UIViewController {

    // MARK: Outlets
    
    @IBOutlet weak var itemNameTextField: UITextField!
    @IBOutlet weak var quantityTextField: UITextField!
    @IBOutlet weak var addButton: UIButton!
    
    var groceryList: GroceryList?
    
    // MARK: Actions
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Handle the text field’s user input through delegate callbacks.
        //itemNameTextField.delegate = self
        //quantityTextField.delegate = self
        
        // Set up views if editing an existing Meal.
        if let groceryList = groceryList {
            itemNameTextField.text = groceryList.ItemName
            quantityTextField.text = groceryList.Quantity?.description
        }
        
        // Enable the Add button only if the item name text field and Quantity is not blank.
        checkValidItemName()
    }

    func checkValidItemName() {
        // Disable the Add button if the text field are empty.
        let itemName = itemNameTextField.text ?? ""
        let quantity = quantityTextField.text ?? ""
        //addButton.isEnabled = !itemName.isEmpty && !quantity.isEmpty
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func saveButton_click(_ sender: UIButton) {
        GroceryListManager.AddGroceryItem(ItemName: itemNameTextField.text!, Quantity: Int(quantityTextField.text!)!)
        itemNameTextField.text = ""
        quantityTextField.text = ""
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
