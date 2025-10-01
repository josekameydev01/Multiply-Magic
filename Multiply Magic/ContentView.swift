//
//  ContentView.swift
//  Multiply Magic
//
//  Created by carlosgalvankamey on 9/29/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [
                    Color(red: 0.55, green: 0.85, blue: 1.0),
                    Color(red: 1.0, green: 0.95, blue: 0.6)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            
            Text("Multiply Magic")
                .font(.largeTitle.bold())
                .foregroundStyle(.white)
                .frame(width: 300, height: 70)
                .background(Color(red: 0.94, green: 0.45, blue: 0.20))
                .cornerRadius(20)
            
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
