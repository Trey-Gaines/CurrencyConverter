//
//  ContentView.swift
//  CurrencyConverter
//
//  Created by Trey Gaines on 6/27/25.
//

import SwiftUI
import Combine

struct ContentView: View {
    @State var myCurrency = Currency()
    @State var usdAmount = ""
    
    
    var isReady: Bool { return usdAmount == ""  }
    
    var body: some View {
        NavigationStack {
            Spacer()
            VStack(spacing: 25) {
                Image(systemName: "dollarsign.circle.fill")
                    .font(.largeTitle)
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                
                TextField("Enter USD", text: $usdAmount)
                    .multilineTextAlignment(.center)
                            .keyboardType(.numberPad)
                            .textFieldStyle(.roundedBorder)
                            .onReceive(Just(usdAmount)) { newValue in
                                let filtered = newValue.filter { "0123456789".contains($0) }
                                if filtered != newValue {
                                    self.usdAmount = filtered
                                    myCurrency.value = Int(self.usdAmount) ?? 0
                                }
                            }
            }
            
            Spacer()
            Grid {
                GridRow {
                    customToggle(curr: $myCurrency.toEuro, shortHand: "EUR", systemImageLight: "", systemImageDark: "")
                    customToggle(curr: $myCurrency.toGBP, shortHand: "GBP", systemImageLight: "", systemImageDark: "")
                    customToggle(curr: $myCurrency.toCHF, shortHand: "CHF", systemImageLight: "", systemImageDark: "")
                }
                
                GridRow {
                    customToggle(curr: $myCurrency.toJPY, shortHand: "JPY", systemImageLight: "", systemImageDark: "")
                    customToggle(curr: $myCurrency.toCAD, shortHand: "CAD", systemImageLight: "", systemImageDark: "")
                    customToggle(curr: $myCurrency.toAUD, shortHand: "AUD", systemImageLight: "", systemImageDark: "")
                }
            }
            Button {
                
            } label: {
                Text("Convert")
                    .foregroundStyle(.white)
                    .fontWeight(.semibold)
                    .padding(10)
                    .background {
                        RoundedRectangle(cornerRadius: 25)
                    }
            }.disabled(isReady)
            
            .navigationTitle("Curreny Converter")
            .navigationBarTitleDisplayMode(.inline)
        }
        .padding()
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(.dark)
}
