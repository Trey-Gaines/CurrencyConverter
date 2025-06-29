//
//  Untitled.swift
//  CurrencyConverter
//
//  Created by Trey Gaines on 6/28/25.
//
import Observation

@Observable
class Currency {
    var value: Int
    var toEuro: Bool = false
    var toGBP: Bool = false
    var toCHF: Bool = false
    var toJPY: Bool = false
    var toCAD: Bool = false
    var toAUD: Bool = false
    
    var euro: Int {
        return Int(Double(value) * 0.85)
    }
    
    var gbp: Int {
        return Int(Double(value) * 0.77)
    }
    
    var chf: Int {
        return Int(Double(value) * 0.80)
    }
    
    var jpy: Int {
        return Int(Double(value) * 144.88)
    }
    
    var cad: Int {
        return Int(Double(value) * 1.37)
    }
    
    var aud: Int {
        return Int(Double(value) * 1.53)
    }
    
    init(value: Int = 0) {
        self.value = value
    }
}
