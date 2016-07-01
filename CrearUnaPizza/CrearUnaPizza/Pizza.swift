//
//  Pizza.swift
//  CrearUnaPizza
//
//  Created by Timo Siegle on 01.07.16.
//  Copyright © 2016 Timo Siegle. All rights reserved.
//

struct Pizza {
    var tamano: String?
    var tamanoRow: Int?
    
    var masa: String?
    var masaRow: Int?
    
    var queso: String?
    var quesoRow: Int?
    
    var ingredientes: [Int: String]
    var ingredienteRows: [Int: Int]
    
    init() {
        self.tamanoRow = 0
        self.ingredientes = [:]
        self.ingredienteRows = [:]
    }
    
    init(tamano: String, tamanoRow: Int = 0, masa: String, masaRow: Int = 0, queso: String, quesoRow: Int = 0, ingredientes:[Int: String], ingredienteRows:[Int: Int]) {
        self.tamano = tamano
        self.tamanoRow = tamanoRow
        self.masa = masa
        self.masaRow = masaRow
        self.queso = queso
        self.quesoRow = quesoRow
        self.ingredientes = ingredientes
        self.ingredienteRows = ingredienteRows
    }
}
