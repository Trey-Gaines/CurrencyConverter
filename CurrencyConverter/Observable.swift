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
    var toEUR: Bool = false
    var toGBP: Bool = false
    var toRUB: Bool = false
    var toJPY: Bool = false
    var toWON: Bool = false
    var toSEK: Bool = false
    
    var eur: Int {
        return Int(Double(value) * 0.85)
    }
    
    var eurAfter = true
    var eurSign = "€"
    var eurLight = "eurosign.circle"
    var eurDark = "eurosign.circle.fill"
    var eurName = "EUR"
    
    var gbp: Int {
        return Int(Double(value) * 0.77)
    }
    
    var gbpAfter = false
    var gbpSign = "£"
    var gbpLight = "sterlingsign.circle"
    var gbpDark = "sterlingsign.circle.fill"
    var gbpName = "GBP"
    
    var rub: Int {
        return Int(Double(value) * 78.57)
    }
    
    var rubAfter = false
    var rubSign = "₽"
    var rubLight = "rublesign.circle"
    var rubDark = "rublesign.circle.fill"
    var rubName = "RUB"
    
    var jpy: Int {
        return Int(Double(value) * 144.88)
    }
    
    var jpyAfter = false
    var jpySign = "¥"
    var jpyLight = "yensign.circle"
    var jpyDark = "yensign.circle.fill"
    var jpyName = "JPY"
    
    var won: Int {
        return Int(Double(value) * 1359.44)
    }
    
    var wonAfter = false
    var wonSign = "₩"
    var wonLight = "wonsign.circle"
    var wonDark = "wonsign.circle.fill"
    var wonName = "WON"
    
    var sek: Int {
        return Int(Double(value) * 9.48)
    }
    
    var sekAfter = true
    var sekSign = "kr"
    var sekLight = "swedishkronasign.circle"
    var sekDark = "swedishkronasign.circle.fill"
    var sekName = "SEK"
    
    init(value: Int = 0) {
        self.value = value
    }
}
