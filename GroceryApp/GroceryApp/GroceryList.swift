//
//  GroceryList.swift
//  GroceryApp
//
//  Created by Keith and Marshneille Lopez on 11/23/16.
//  Copyright © 2016 icc. All rights reserved.
//

import Foundation
import UIKit

class GroceryList: NSObject {
    var ItemName: String?
    var Quantity: Int?
    
    // MARK: Initialization
    
    init?(ItemName: String, Quantity: Int) {
        // Initialize stored properties.
        self.ItemName = ItemName
        self.Quantity = Quantity
        
        super.init()
        
        // Initialization should fail if there is no item name or if the quantity is 0.
        if ItemName.isEmpty || Quantity == 0 {
            return nil
        }
    }
    
    override init() {
        super.init()
    }
}
