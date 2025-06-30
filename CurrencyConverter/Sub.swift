//
//  Sub.swift
//  CurrencyConverter
//
//  Created by Trey Gaines on 6/29/25.
//
import SwiftUI

struct Tile: View {
    @State var base: Int
    @State var value: Int
    @State var currency: String
    @State var currencySign: String
    @State var isBehind: Bool
    @State var currencySymbol: String
    @State var color: Color
    
    var baseConverted: String {
        base.formatted(.number.precision(.fractionLength(0)))
    }
    
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25).fill(color)
                .frame(height: 150)
                .opacity(0.2)
            
            RoundedRectangle(cornerRadius: 25)
                .frame(height: 150)
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 25))
                .opacity(0.6)
            
            VStack {
                HStack {
                    Text("\(currency)")
                        .fontWeight(.semibold)
                        .font(.title2)
                        .opacity(0.5)
                    Spacer()
                    Image(systemName: currencySymbol)
                        .font(.title2)
                        .opacity(0.6)
                        
                }
                Spacer()
                HStack {
                    if isBehind {
                        Text(value, format: .number.grouping(.automatic))
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .minimumScaleFactor(0.01)
                            .lineLimit(1)
                        Text("\(currencySign)")
                            .fontWeight(.semibold)
                            .font(.title2)
                    } else {
                        Text("\(currencySign)")
                            .fontWeight(.semibold)
                            .font(.title2)
                        Text(value, format: .number.grouping(.automatic))
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .minimumScaleFactor(0.01)
                            .lineLimit(1)
                    }
                }
                Spacer()
                Spacer()
                Text("$ \(baseConverted)")
                    .font(.caption)
                    .padding(.leading, 0)
                    .fontWeight(.semibold)
            }
            .padding()
            .frame(height: 150)
            
            
        }
    }
}

#Preview {
    Tile(base: 100000, value: 100000, currency: "USD", currencySign: "$", isBehind: false, currencySymbol: "dollarsign.circle", color: .blue)
        .preferredColorScheme(.dark)
}
