//
//  IngredientesInterfaceController.swift
//  PizzaWatchApp
//
//  Created by Dev on 11/16/15.
//  Copyright © 2015 Dev. All rights reserved.
//

import WatchKit
import Foundation


class IngredientesInterfaceController: WKInterfaceController {
    
    
    var items : [String:Bool] = [String:Bool]()
    
    var pizza :Pizza = Pizza()
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        pizza = context as! Pizza
        
        items.updateValue(false, forKey: "Jamón")
        items.updateValue(false, forKey: "Pepperoni")
        items.updateValue(false, forKey: "Pavo")
        items.updateValue(false, forKey: "Salchicha")
        items.updateValue(false, forKey: "Aceituna")
        items.updateValue(false, forKey: "Cebolla")
        items.updateValue(false, forKey: "Pimiento")
        items.updateValue(false, forKey: "Piña")
        items.updateValue(false, forKey: "Anchoa")
    
    }
    
    @IBAction func onJamonSwitch(value: Bool) {
        items.updateValue(value, forKey: "Jamón")
    }
    
    @IBAction func onPepperoniSwitch(value: Bool) {
        items.updateValue(value, forKey: "Pepperoni")
    }
    
    @IBAction func onPavoSwitch(value: Bool) {
        items.updateValue(value, forKey: "Pavo")
    }
    
    @IBAction func onSalchichaSwitch(value: Bool) {
        items.updateValue(value, forKey: "Salchicha")
    }
    
    @IBAction func onAceitunaSwitch(value: Bool) {
        items.updateValue(value, forKey: "Aceituna")
    }
    
    @IBAction func onCebollaSwitch(value: Bool) {
        items.updateValue(value, forKey: "Cebolla")
    }
    
    @IBAction func onPimientoSwitch(value: Bool) {
        items.updateValue(value, forKey: "Pimiento")
    }
    
    @IBAction func onPinaSwitch(value: Bool) {
        items.updateValue(value, forKey: "Piña")
    }
    
    @IBAction func onAnchoaSwitch(value: Bool) {
        items.updateValue(value, forKey: "Anchoa")
    }
    
    @IBAction func next() {
        let ingredientes : [String] = items.filter{$0.1}.map{$0.0}
        self.pizza.ingredientes = ingredientes
        
        let size = ingredientes.count
        if size >= 1 && size <= 5 {
            pushControllerWithName("ConfirmacionPizza", context: pizza)
        }
        else {
            
            let action = WKAlertAction(title: "OK", style: .Default){}
            self.presentAlertControllerWithTitle("Validacion", message: "Debe seleccionar de 1 a 5 ingredientes", preferredStyle: WKAlertControllerStyle.ActionSheet, actions: [action])
        
        }
        
    }

}
