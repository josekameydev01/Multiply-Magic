//
//  ContentView.swift
//  Multiply Magic
//
//  Created by carlosgalvankamey on 9/29/25.
//

import SwiftUI

struct CircularButtonStyle: ViewModifier {
    let backgroundColor = Color(red: 0.94, green: 0.45, blue: 0.20)
    func body(content: Content) -> some View {
        content
            .fontWeight(.bold)
            .frame(width: 40, height: 40)
            .background(backgroundColor)
            .clipShape(.circle)
            .foregroundStyle(.white)
    }
}

extension View {
    func circularButtonStyle() -> some View {
        self.modifier(CircularButtonStyle())
    }
}

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    colors: [
                        Color(red: 0.55, green: 0.85, blue: 1.0),
                        Color(red: 1.0, green: 0.95, blue: 0.6)
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
                
                VStack (spacing: 80) {
                    Text("Multiply Magic 🧮")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .fontWeight(.bold)
                        .frame(width: 300, height: 70)
                        .background(Color(red: 0.94, green: 0.45, blue: 0.20))
                        .cornerRadius(20)

                    VStack {
                        Text("Which tables do you want to practice?")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundStyle(Color(red: 0.2, green: 0.2, blue: 0.35))
                        
                        VStack (spacing: 10){
                            HStack {
                                ForEach(1...6, id: \.self) { table in
                                    Button("\(table)") {
                                        
                                    }
                                    .circularButtonStyle()
                                }
                            }
                            HStack {
                                ForEach(7...12, id: \.self) { table in
                                    Button("\(table)") {
                                        
                                    }
                                    .circularButtonStyle()
                                }
                            }
                        }
                    }
                    
                    VStack {
                        Text("How many questions would you like to answer?")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundStyle(Color(red: 0.2, green: 0.2, blue: 0.35))
                        
                        HStack {
                            ForEach(1...4, id: \.self) { option in
                                Button("\(option * 5)") {
                                    
                                }
                                .circularButtonStyle()
                            }
                        }
                    }
                    
                    Button("Start Quiz →") {
                        
                    }
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.horizontal, 40)
                    .padding(.vertical, 16)
                    .background(Color(red: 0.94, green: 0.45, blue: 0.20))
                    .foregroundStyle(.white)
                    .clipShape(.capsule)
                }
                .padding(.top, -30)
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    ContentView()
}
