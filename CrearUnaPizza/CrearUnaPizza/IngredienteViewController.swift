//
//  IngredienteViewController.swift
//  CrearUnaPizza
//
//  Created by Timo Siegle on 01.07.16.
//  Copyright © 2016 Timo Siegle. All rights reserved.
//

import UIKit

class IngredienteViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var pizza = Pizza?()
    let ingredienteData = ["ninguno", "jamón", "pepperoni", "pavo", "salchicha", "aceituna", "cebolla", "pimiento", "piña", "anchoa"]
    
    @IBOutlet weak var ingrediente1: UIPickerView!
    @IBOutlet weak var ingrediente2: UIPickerView!
    @IBOutlet weak var ingrediente3: UIPickerView!
    @IBOutlet weak var ingrediente4: UIPickerView!
    @IBOutlet weak var ingrediente5: UIPickerView!
    
    override func viewDidLoad() {
        
        ingrediente1.dataSource = self
        ingrediente1.delegate = self
        
        ingrediente2.dataSource = self
        ingrediente2.delegate = self
        
        ingrediente3.dataSource = self
        ingrediente3.delegate = self
        
        ingrediente4.dataSource = self
        ingrediente4.delegate = self
        
        ingrediente5.dataSource = self
        ingrediente5.delegate = self
    }
    
    override func viewWillAppear(animated: Bool) {
        let pickerViews = [ingrediente1, ingrediente2, ingrediente3, ingrediente4, ingrediente5]
        
        if let rows = pizza?.ingredienteRows {
            for (key, value) in rows {
                pickerViews[key].selectRow(value, inComponent: 0, animated: true)
                pizza?.ingredienteRows[key] = value
                pizza?.ingredientes[key] = ingredienteData[key]
            }
        }
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ingredienteData.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return ingredienteData[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (pickerView == ingrediente1) {
            pizza?.ingredienteRows[0] = row
            pizza?.ingredientes[0] = ingredienteData[row]
        } else if (pickerView == ingrediente2) {
            pizza?.ingredienteRows[1] = row
            pizza?.ingredientes[1] = ingredienteData[row]
        } else if (pickerView == ingrediente3) {
            pizza?.ingredienteRows[2] = row
            pizza?.ingredientes[2] = ingredienteData[row]
        } else if (pickerView == ingrediente4) {
            pizza?.ingredienteRows[3] = row
            pizza?.ingredientes[3] = ingredienteData[row]
        } else if (pickerView == ingrediente5) {
            pizza?.ingredienteRows[4] = row
            pizza?.ingredientes[4] = ingredienteData[row]
        }
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "segueResumen") {
            let destinationViewController = segue.destinationViewController as! ResumenViewController
            destinationViewController.pizza = pizza
        }
    }
    
}
