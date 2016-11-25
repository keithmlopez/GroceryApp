//
//  AddViewController.swift
//  demoFoodTracker
//
//  Created by Keith and Marshneille Lopez on 11/24/16.
//  Copyright © 2016 icc. All rights reserved.
//

import UIKit

class AddViewController: UIViewController, UITextFieldDelegate {

    var meal: Meal?
    
    @IBOutlet weak var saveButton: UIButton!
    
    @IBAction func cancel(_ sender: UIButton, forEvent event: UIEvent) {
        // depending on the style of presentation (modal or push presentation), this view controller needs to be dismissed in two different ways
        let isPresentingInAddMealMode = presentingViewController is UINavigationController
        
        if isPresentingInAddMealMode {
            dismiss(animated: true, completion: nil)
        }
        else {
            navigationController!.popViewController(animated: true)
        }
    }
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var quantityTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // handle the text field's user input through delegate callbacks
        nameTextField.delegate = self
        quantityTextField.delegate = self
        
        // enable the Save button only if the text field has a valid Meal Name
        //checkValidMealName()
        
        // set up views if editing an existing meal
        if let meal = meal {
            navigationItem.title = meal.name
            nameTextField.text = meal.name
            quantityTextField.text = meal.quantity?.description
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard
        textField.resignFirstResponder()
        return true
    }
    
    /*
    func textFieldDidBeginEditing(textField: UITextField) {
        // disable the Save button while editing
        //saveButton.isEnabled = false
    }
    */
    
    func checkValidMealName() {
        // disable the Save button if the text field is empty
        let text = nameTextField.text ?? ""
        saveButton.isEnabled = !text.isEmpty
    }
    
    /*
    func textFieldDidEndEditing(textField: UITextField) {
        //checkValidMealName()
        //navigationItem.title = textField.text
    }
    */
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if saveButton == sender as! UIButton! {
            let name = nameTextField.text ?? ""
            let quantity = quantityTextField.text ?? ""
            meal = Meal(name: name, quantity: Int(quantity)!)
        }
    }
    

}
