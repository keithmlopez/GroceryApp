//
//  Meal.swift
//  demoFoodTracker
//
//  Created by Keith and Marshneille Lopez on 11/24/16.
//  Copyright © 2016 icc. All rights reserved.
//

import UIKit
import Foundation

class Meal: NSObject, NSCoding {
    
    // MARK: Properties
    
    var name: String?
    var quantity: Int?
    
    init?(name:String, quantity: Int){
        self.name = name;
        self.quantity = quantity;
        super.init()
        // initialization should fail if there is no name
        if name.isEmpty || quantity < 0 {
            return nil
        }
    }
    
    // MARK: NSCoding
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey:PropertyKey.nameKey)
        aCoder.encode(quantity, forKey:PropertyKey.qtyKey)
    }
    
    required convenience init?(coder aDecoder:NSCoder) {
        let name = aDecoder.decodeObject(forKey: PropertyKey.nameKey) as! String
        let quantity = aDecoder.decodeObject(forKey: PropertyKey.qtyKey) as! Int
        self.init(name: name, quantity: quantity)
    }
    
    // MARK: Archiving Paths
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("meals")
}

struct PropertyKey {
    static let nameKey = "name"
    static let qtyKey = "quantity"
}


