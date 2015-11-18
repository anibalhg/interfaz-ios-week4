//
//  QuesoInterfaceController.swift
//  PizzaWatchApp
//
//  Created by Dev on 11/16/15.
//  Copyright © 2015 Dev. All rights reserved.
//

import WatchKit
import Foundation

class QuesoInterfaceController: WKInterfaceController {

    @IBOutlet var picker: WKInterfacePicker!
    var items : [String] = [String]()
    var selectedIndex = 0
    var pizza :Pizza = Pizza()
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        pizza = context as! Pizza
        
        items.append("Mozarela")
        items.append("Cheddar")
        items.append("Parmesano")
        items.append("Sin queso")
        
        var pickerItems : [WKPickerItem] = [WKPickerItem]()
        for i in 0...items.count-1 {
            let pickerItem = WKPickerItem()
            pickerItem.title = items[i]
            pickerItems.append(pickerItem)
        }
        self.picker.setItems(pickerItems)
    }
    
    @IBAction func itemPickerUpdate(index: Int) {
        self.selectedIndex = index
    }
    
    @IBAction func next() {
        pizza.queso = items[self.selectedIndex]
        pushControllerWithName("IngredientesPizza", context: pizza)
    }

}
