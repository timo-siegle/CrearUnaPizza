//
//  MasaViewController.swift
//  CrearUnaPizza
//
//  Created by Timo Siegle on 01.07.16.
//  Copyright © 2016 Timo Siegle. All rights reserved.
//

import UIKit

class MasaViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var pizza = Pizza?()
    let masaData = ["delgada", "crujiente", "gruesa"]
    @IBOutlet weak var masas: UIPickerView!
    
    override func viewDidLoad() {
        masas.dataSource = self
        masas.delegate = self
    }
    
    override func viewWillAppear(animated: Bool) {
        if let row = pizza?.masaRow {
            masas.selectRow(row, inComponent: 0, animated: true)
            pizza?.masaRow = row
            pizza?.masa = masaData[row]
        } else {
            pizza?.masaRow = 0
            pizza?.masa = masaData[0]
        }
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return masaData.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return masaData[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pizza?.masaRow = row
        pizza?.masa = masaData[row]
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if (segue.identifier == "segueQueso") {
            let destinationViewController = segue.destinationViewController as! QuesoViewController
            destinationViewController.pizza = pizza
        }
    }
    
}
