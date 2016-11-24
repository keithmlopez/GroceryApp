//
//  GroceryListManager.swift
//  GroceryApp
//
//  Created by Keith and Marshneille Lopez on 11/23/16.
//  Copyright © 2016 icc. All rights reserved.
//

import UIKit

class GroceryListManager: NSObject {
    static var arrGroceryList = [GroceryList]()
    
    class func AddGroceryItem(ItemName: String, Quantity: Int){
        let r = GroceryList(ItemName: ItemName, Quantity: Quantity)!
        arrGroceryList.append(r)
    }
    
    class func DeleteGroceryItem(_ id: Int){
        arrGroceryList.remove(at: id)
    }
    
    class func GetGroceryItem(_ id: Int) -> GroceryList {
        if(arrGroceryList.count > 0){
            return arrGroceryList[id]
        }
        
        return GroceryList()
    }
    
}
