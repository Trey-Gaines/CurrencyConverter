//
//  Toggle.swift
//  CurrencyConverter
//
//  Created by Trey Gaines on 6/28/25.
//
import SwiftUI
import Observation

struct customToggle: View {
    @State var isOn: Bool = false
    @State var systemImageLight: String
    @State var systemImageDark: String
    
    var body: some View {
        Button {
            withAnimation(.spring()) {
                isOn.toggle()
            }
        } label: {
            if !isOn {
                ZStack {
                    Capsule()
                        .frame(width:80,height:44)
                        .foregroundColor(.gray)
                    ZStack{
                        Circle()
                            .frame(width:40, height:40)
                            .foregroundColor(.white)
                        Image(systemName: systemImageLight)
                            .font(.largeTitle)
                            
                    }
                    .shadow(color: .black.opacity(0.14), radius: 4, x: 0, y: 2)
                    .offset(x:-18)
                    .padding(24)
                }
            } else {
                ZStack {
                    Capsule()
                        .frame(width:80,height:44)
                        .foregroundColor(.green)
                    ZStack{
                        Circle()
                            .frame(width:40, height:40)
                            .foregroundColor(.white)
                        Image(systemName: systemImageDark)
                            .font(.largeTitle)
                    }
                    .shadow(color: .black.opacity(0.14), radius: 4, x: 0, y: 2)
                    .offset(x:18)
                    .padding(24)
                    
                }
            }
        }
    }
}


#Preview {
    customToggle(systemImageLight: "eurosign.circle", systemImageDark: "eurosign.circle.fill")
}
