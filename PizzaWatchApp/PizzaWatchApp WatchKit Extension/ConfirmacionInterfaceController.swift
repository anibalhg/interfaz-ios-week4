//
//  ConfirmacionInterfaceController.swift
//  PizzaWatchApp
//
//  Created by Dev on 11/18/15.
//  Copyright © 2015 Dev. All rights reserved.
//

import WatchKit
import Foundation


class ConfirmacionInterfaceController: WKInterfaceController {
    
    @IBOutlet var lblDimension: WKInterfaceLabel!
    @IBOutlet var lblMasa: WKInterfaceLabel!
    @IBOutlet var lblQueso: WKInterfaceLabel!
    @IBOutlet var lblIngredientes: WKInterfaceLabel!
    
    var pizza :Pizza = Pizza()
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        pizza = context as! Pizza
        self.lblDimension.setText(pizza.dimension!)
        self.lblMasa.setText(pizza.masa!)
        self.lblQueso.setText(pizza.queso!)
        
        var str = ""
        for ingrediente in self.pizza.ingredientes! {
            str += "\(ingrediente), "
        }
        let strIngredientes = str.substringWithRange(Range<String.Index>(start: str.startIndex, end: str.endIndex.advancedBy(-2)))
        self.lblIngredientes.setText(strIngredientes)
    }
    
    @IBAction func finish() {
        let action = WKAlertAction(title: "OK", style: .Default){
            self.popToRootController()
        }
        self.presentAlertControllerWithTitle("Info", message: "La orden ha sido enviada", preferredStyle: WKAlertControllerStyle.ActionSheet, actions: [action])
    }

}
