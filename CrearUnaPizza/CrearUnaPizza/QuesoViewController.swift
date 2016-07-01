//
//  QuesoViewController.swift
//  CrearUnaPizza
//
//  Created by Timo Siegle on 01.07.16.
//  Copyright © 2016 Timo Siegle. All rights reserved.
//

import UIKit

class QuesoViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var pizza = Pizza?()
    let quesoData = ["mozarela", "cheddar", "parmesano", "sin queso"]
    @IBOutlet weak var quesos: UIPickerView!
    
    override func viewDidLoad() {
        quesos.dataSource = self
        quesos.delegate = self
    }
    
    override func viewWillAppear(animated: Bool) {
        if let row = pizza?.quesoRow {
            quesos.selectRow(row, inComponent: 0, animated: true)
            pizza?.quesoRow = row
            pizza?.queso = quesoData[row]
        } else {
            pizza?.quesoRow = 0
            pizza?.queso = quesoData[0]
        }
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return quesoData.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return quesoData[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pizza?.quesoRow = row
        pizza?.queso = quesoData[row]
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "segueIngredientes") {
            let destinationViewController = segue.destinationViewController as! IngredienteViewController
            destinationViewController.pizza = pizza
        }
    }
    
}
