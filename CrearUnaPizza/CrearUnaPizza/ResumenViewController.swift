//
//  ResumenViewController.swift
//  CrearUnaPizza
//
//  Created by Timo Siegle on 01.07.16.
//  Copyright © 2016 Timo Siegle. All rights reserved.
//

import UIKit

class ResumenViewController: UIViewController {
    
    var pizza = Pizza?()
    
    @IBOutlet weak var tamano: UILabel!
    @IBOutlet weak var masa: UILabel!
    @IBOutlet weak var queso: UILabel!
    @IBOutlet weak var ingredientes: UILabel!
    
    override func viewWillAppear(animated: Bool) {
        if let pizza = pizza {
            tamano.text = pizza.tamano
            masa.text = pizza.masa
            queso.text = pizza.queso
            ingredientes.text = pizza.ingredientes.values.joinWithSeparator(", ")
        }
    }
}
