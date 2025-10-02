//
//  QuizView.swift
//  Multiply Magic
//
//  Created by carlosgalvankamey on 10/2/25.
//

import SwiftUI

struct QuizView: View {
    let table: Int
    let numOfquestions: Int
    
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
            
            VStack {
                Text("Multiply Magic 🧮")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                    .fontWeight(.bold)
                    .frame(width: 300, height: 70)
                    .background(Color(red: 0.94, green: 0.45, blue: 0.20))
                    .cornerRadius(20)
                
                HStack {
                    Text("Question 1 of 10")
                    
                    Text("Score: 1/10")
                }
                
                VStack {
                    Text("How much is?")
                    Text("9 x 2")
                }
                
                VStack {
                    HStack {
                        ForEach(0...1, id: \.self) { index in
                            Button("\(index)") {
                                
                            }
                        }
                    }
                    HStack {
                        ForEach(2...3, id: \.self) { index in
                            Button("\(index)") {
                                
                            }
                        }
                    }
                }
                
                Button("Next Question") {
                    
                }
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    QuizView(table: 10, numOfquestions: 10)
}
