//
//  TamanoViewController.swift
//  CrearUnaPizza
//
//  Created by Timo Siegle on 30.06.16.
//  Copyright © 2016 Timo Siegle. All rights reserved.
//

import UIKit

class TamanoViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var pizza = Pizza?()
    let tamanoData = ["chica", "mediana", "grande"]
    @IBOutlet weak var tamanos: UIPickerView!
    
    override func viewDidLoad() {
        tamanos.dataSource = self
        tamanos.delegate = self
    }
    
    override func viewWillAppear(animated: Bool) {
        if let row = pizza?.tamanoRow {
            tamanos.selectRow(row, inComponent: 0, animated: true)
            pizza?.tamanoRow = row
            pizza?.tamano = tamanoData[row]
        } else {
            pizza?.tamanoRow = 0
            pizza?.tamano = tamanoData[0]
        }
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return tamanoData.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return tamanoData[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pizza?.tamanoRow = row
        pizza?.tamano = tamanoData[row]
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "segueMasa") {
            let destinationViewController = segue.destinationViewController as! MasaViewController
            destinationViewController.pizza = pizza
        }
    }
}
