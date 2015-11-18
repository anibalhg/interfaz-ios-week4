//
//  InterfaceController.swift
//  PizzaWatchApp WatchKit Extension
//
//  Created by Dev on 11/16/15.
//  Copyright © 2015 Dev. All rights reserved.
//

import WatchKit
import Foundation

class DimensionInterfaceController: WKInterfaceController {
    
    
    @IBOutlet var picker: WKInterfacePicker!
    var items : [String] = [String]()
    var selectedIndex = 0
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        items.append("Chica")
        items.append("Mediana")
        items.append("Grande")
        
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
        let pizza = Pizza()
        pizza.dimension = items[self.selectedIndex]
        pushControllerWithName("MasaPizza", context: pizza)
    }
    
}
