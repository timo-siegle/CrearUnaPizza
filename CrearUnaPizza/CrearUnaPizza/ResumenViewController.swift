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
    
    @IBOutlet weak var resultado: UILabel!
    @IBOutlet weak var enviarLaPizza: UIButton!
    
    override func viewWillAppear(animated: Bool) {
        if let pizza = pizza {
            
            if pizza.tamano != nil && pizza.masa != nil && pizza.queso != nil && pizza.ingredientes.count > 0 {
                tamano.text = pizza.tamano
                masa.text = pizza.masa
                queso.text = pizza.queso
                ingredientes.text = pizza.ingredientes.values.joinWithSeparator(", ")
            } else {
                resultado.text = "Por favor, verifica tu pedido."
                enviarLaPizza.enabled = false
            }
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "segueReiniciar") {
            let destinationViewController = segue.destinationViewController as! TamanoViewController
            destinationViewController.pizza?.tamano = nil
            destinationViewController.pizza?.tamanoRow = nil
            destinationViewController.pizza?.masa = nil
            destinationViewController.pizza?.masaRow = nil
            destinationViewController.pizza?.queso = nil
            destinationViewController.pizza?.quesoRow = nil
            destinationViewController.pizza?.ingredientes = [:]
            destinationViewController.pizza?.ingredienteRows = [:]

        }
    }

}
