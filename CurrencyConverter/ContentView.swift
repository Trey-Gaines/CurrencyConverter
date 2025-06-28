//
//  ContentView.swift
//  CurrencyConverter
//
//  Created by Trey Gaines on 6/27/25.
//

import SwiftUI
import Combine

struct ContentView: View {
    @State var euroSelected = false
    @State var usdAmount = ""
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
                                }
                            }
            }
            
            Spacer()
            Grid {
                GridRow {
                    customToggle(systemImageLight: "", systemImageDark: "")
                    customToggle(systemImageLight: "", systemImageDark: "")
                    customToggle(systemImageLight: "", systemImageDark: "")
                }
                
                GridRow {
                    customToggle(systemImageLight: "", systemImageDark: "")
                    customToggle(systemImageLight: "", systemImageDark: "")
                    customToggle(systemImageLight: "", systemImageDark: "")
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
            }
            
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
