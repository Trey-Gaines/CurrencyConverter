//
//  ContentView.swift
//  CurrencyConverter
//
//  Created by Trey Gaines on 6/27/25.
//

import SwiftUI
import Combine

struct ContentView: View {
    @Environment(\.verticalSizeClass) var verticalSizeClass: UserInterfaceSizeClass?
    @Environment(\.horizontalSizeClass) var horizontalSizeClass: UserInterfaceSizeClass?

    @State var curr = Currency()
    @State var usdAmount = ""
    let mySet = Set("0123456789")
    let myColors = Color.getRandomColor()
    
    
    var convertTo: Bool {
        if curr.toRUB || curr.toEUR || curr.toGBP || curr.toJPY || curr.toWON || curr.toSEK { return false } else { return true }
    }
    
    var notEmpty: Bool { usdAmount == "" }
    
    
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
                                let filtered = newValue.filter { mySet.contains($0) }
                                if filtered != newValue {
                                    self.usdAmount = filtered

                                }
                            }
                            .onChange(of: usdAmount) {
                                _, _ in curr.value = Int(usdAmount) ?? 0
                            }
            }
            
            Spacer()
            Grid {
                if UIDevice.current.userInterfaceIdiom == .pad || (UIDevice.current.userInterfaceIdiom == .phone && horizontalSizeClass == .compact && verticalSizeClass == .regular) {
                    GridRow {
                        customToggle(curr: $curr.toEUR, shortHand: curr.eurName, systemImageLight: curr.eurLight, systemImageDark: curr.eurDark)
                        customToggle(curr: $curr.toGBP, shortHand: curr.gbpName, systemImageLight: curr.gbpLight, systemImageDark: curr.gbpDark)
                        customToggle(curr: $curr.toRUB, shortHand: curr.rubName, systemImageLight: curr.rubLight, systemImageDark: curr.rubDark)
                    }
                    
                    
                    GridRow {
                        customToggle(curr: $curr.toJPY, shortHand: curr.jpyName, systemImageLight: curr.jpyLight, systemImageDark: curr.jpyDark)
                        customToggle(curr: $curr.toWON, shortHand: curr.wonName, systemImageLight: curr.wonLight, systemImageDark: curr.wonDark)
                        customToggle(curr: $curr.toSEK, shortHand: curr.sekName, systemImageLight: curr.sekLight, systemImageDark: curr.sekDark)
                    }
                } else {
                    GridRow {
                        customToggle(curr: $curr.toEUR, shortHand: curr.eurName, systemImageLight: curr.eurLight, systemImageDark: curr.eurDark)
                        customToggle(curr: $curr.toGBP, shortHand: curr.gbpName, systemImageLight: curr.gbpLight, systemImageDark: curr.gbpDark)
                        customToggle(curr: $curr.toRUB, shortHand: curr.rubName, systemImageLight: curr.rubLight, systemImageDark: curr.rubDark)
                        customToggle(curr: $curr.toJPY, shortHand: curr.jpyName, systemImageLight: curr.jpyLight, systemImageDark: curr.jpyDark)
                        customToggle(curr: $curr.toWON, shortHand: curr.wonName, systemImageLight: curr.wonLight, systemImageDark: curr.wonDark)
                        customToggle(curr: $curr.toSEK, shortHand: curr.sekName, systemImageLight: curr.sekLight, systemImageDark: curr.sekDark)
                    }
                    
                    
                }
                
            }
            
            NavigationLink(destination: Converted(curr: curr, myColors: myColors)) {
                Text("Convert")
                    .foregroundStyle(.white)
                    .fontWeight(.semibold)
                    .padding(10)
                    .background {
                        RoundedRectangle(cornerRadius: 25)
                    }
            }.disabled(convertTo).disabled(notEmpty)
                
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
