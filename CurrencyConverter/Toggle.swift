//
//  Toggle.swift
//  CurrencyConverter
//
//  Created by Trey Gaines on 6/28/25.
//
import SwiftUI
import Observation

struct customToggle: View {
    @Binding var curr: Bool
    @State var shortHand: String
    @State var systemImageLight: String
    @State var systemImageDark: String
    
    var myColor: Color {
        .init(red: 59/255, green: 59/255, blue: 59/255)
    }
    
    var body: some View {
        Button {
            withAnimation(.spring()) {
                curr.toggle()
            }
        } label: {
            if !curr {
                ZStack {
                    Capsule()
                        .frame(width:80,height:44)
                        .foregroundColor(myColor)
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
                    Text(shortHand)
                        .font(.caption)
                        .foregroundStyle(.white)
                        .offset(x:18)
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
                    Text(shortHand)
                        .font(.caption)
                        .foregroundStyle(.white)
                        .offset(x:-18)
                }
            }
        }
    }
}

