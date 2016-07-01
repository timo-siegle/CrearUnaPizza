//
//  ViewController.swift
//  CrearUnaPizza
//
//  Created by Timo Siegle on 25.06.16.
//  Copyright © 2016 Timo Siegle. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let pizza = Pizza()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func confirmaSeleccion(sender: UIButton) {
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if (segue.identifier == "segueTamano") {
            let destinationViewController = segue.destinationViewController as! TamanoViewController
            destinationViewController.pizza = pizza
        }
    }
}

