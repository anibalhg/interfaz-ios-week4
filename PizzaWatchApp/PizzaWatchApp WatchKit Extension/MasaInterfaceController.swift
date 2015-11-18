//
//  MasaInterfaceController.swift
//  PizzaWatchApp
//
//  Created by Dev on 11/16/15.
//  Copyright © 2015 Dev. All rights reserved.
//

import WatchKit
import Foundation

class MasaInterfaceController: WKInterfaceController {

    @IBOutlet var picker: WKInterfacePicker!
    var items : [String] = [String]()
    var selectedIndex = 0
    var pizza :Pizza = Pizza()
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        pizza = context as! Pizza
        
        items.append("Delgada")
        items.append("Crujiente")
        items.append("Gruesa")
        
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
        pizza.masa = items[self.selectedIndex]
        pushControllerWithName("QuesoPizza", context: pizza)
    }

}
