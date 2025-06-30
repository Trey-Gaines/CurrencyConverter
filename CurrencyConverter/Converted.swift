//
//  Converted.swift
//  CurrencyConverter
//
//  Created by Trey Gaines on 6/29/25.
//
import SwiftUI

struct Converted: View {
    @State var curr: Currency
    @State var myColors: [Color]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                if curr.toEUR {
                    Tile(base: curr.value, value: curr.eur, currency: curr.eurName, currencySign: curr.eurSign, isBehind: curr.eurAfter, currencySymbol: curr.eurLight, color: myColors[0])
                }
                
                if curr.toGBP {
                    Tile(base: curr.value, value: curr.gbp, currency: curr.gbpName, currencySign: curr.gbpSign, isBehind: curr.gbpAfter, currencySymbol: curr.gbpLight, color: myColors[1])
                }
                
                if curr.toRUB {
                    Tile(base: curr.value, value: curr.rub, currency: curr.rubName, currencySign: curr.rubSign, isBehind: curr.rubAfter, currencySymbol: curr.rubLight, color: myColors[2])
                }
                
                if curr.toJPY {
                    Tile(base: curr.value, value: curr.jpy, currency: curr.jpyName, currencySign: curr.jpySign, isBehind: curr.jpyAfter, currencySymbol: curr.jpyLight, color: myColors[3])
                }
                
                if curr.toSEK {
                    Tile(base: curr.value, value: curr.sek, currency: curr.sekName, currencySign: curr.sekSign, isBehind: curr.sekAfter, currencySymbol: curr.sekLight, color: myColors[4])
                }
                
                if curr.toWON {
                    Tile(base: curr.value, value: curr.won, currency: curr.wonName, currencySign: curr.wonSign, isBehind: curr.wonAfter, currencySymbol: curr.wonLight, color: myColors[5])
                }
            }.safeAreaPadding(.vertical, 15)
                .ignoresSafeArea(.all, edges: .bottom)
                .navigationTitle(Text("Currencies"))
                .navigationBarTitleDisplayMode(.inline)
                
        }
        
    }
}


#Preview {
    let myColors = Color.getRandomColor()
    Converted(curr: Currency(), myColors: myColors)
}


public extension Color {
    static func random() -> Color {
        Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1)
        )
    }
    
    static func getRandomColor() -> [Color] {
        var myColors: Set<Color> = []
        while myColors.count < 6 {
            myColors.insert(Color.random())
        }; return Array(myColors)
    }
}
