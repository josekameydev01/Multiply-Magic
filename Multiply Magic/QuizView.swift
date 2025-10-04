//
//  QuizView.swift
//  Multiply Magic
//
//  Created by carlosgalvankamey on 10/2/25.
//

import SwiftUI

struct AnswerButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title3)
            .frame(maxWidth: .infinity, minHeight: 60)
            .background(Color(red: 0.94, green: 0.45, blue: 0.20))
            .foregroundStyle(.white)
            .fontWeight(.bold)
            .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

extension View {
    func answerButtonStyle() -> some View {
        self.modifier(AnswerButtonModifier())
    }
}

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
            .ignoresSafeArea()
            
            VStack {
                Text("Multiply Magic 🧮")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                    .fontWeight(.bold)
                    .frame(width: 300, height: 70)
                    .background(Color(red: 0.94, green: 0.45, blue: 0.20))
                    .cornerRadius(20)
                
                Spacer()
                
                HStack {
                    Text("Question 1 of 10")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    Text("Score: 1/10")
                        .padding(6)
                        .background(Color(red: 0.94, green: 0.45, blue: 0.20))
                        .foregroundStyle(.white)
                        .fontWeight(.bold)
                        .clipShape(.capsule)
                }
                .padding(.horizontal)
                
                ProgressView(value: Double(1), total: Double(numOfquestions))
                    .tint(.black)
                    .padding(.horizontal)
                
                Spacer()
                
                VStack {
                    Text("How much is?")
                        .font(.title2)
                        .fontWeight(.bold)
                        
                    Text("9 x 2")
                        .font(.system(size: 40, weight: .bold))
                        .foregroundStyle(Color(red: 0.94, green: 0.45, blue: 0.20))
                    
                }
                .padding(50)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .shadow(radius: 5)
                
                Spacer()
                
                VStack {
                    HStack {
                        ForEach(0...1, id: \.self) { index in
                            Button("\(index)") {
                                
                            }
                            .answerButtonStyle()
                        }
                    }
                    HStack {
                        ForEach(2...3, id: \.self) { index in
                            Button("\(index)") {
                                
                            }
                            .answerButtonStyle()
                        }
                    }
                }
                .padding(.horizontal, 20)
                
                Spacer()
                
                Button(action: {
                    
                }, label: {
                    Text("Next Question →")
                        .foregroundStyle(.white)
                        .fontWeight(.bold)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 10)
                        .background(.gray.opacity(0.6))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                })
                
                Spacer()
            }
        }
    }
}

#Preview {
    QuizView(table: 10, numOfquestions: 10)
}
