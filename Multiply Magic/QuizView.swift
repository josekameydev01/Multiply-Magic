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
    let numOfQuestions: Int
    
    @State private var numOfQuestion = 1
    @State private var question = ""
    @State private var options: [Int] = [1,2,3,4]
    @State private var score = 0
    @State private var factorB = 1
    @State private var selectedOption = -1
    @State private var showErrorAlert = false
    @State private var showFeedbackAlert = false
    @State private var showGameOverAlert = false
    @State private var feedbackAlertTitle = ""
    @State private var gameOverAlertTitle = ""
    @State private var correctAnswer = 0
    
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
                    Text("Question \(numOfQuestion > numOfQuestions ? numOfQuestions : numOfQuestion) of \(numOfQuestions)")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    Text("Score: \(score)/\(numOfQuestions)")
                        .padding(6)
                        .background(Color(red: 0.94, green: 0.45, blue: 0.20))
                        .foregroundStyle(.white)
                        .fontWeight(.bold)
                        .clipShape(.capsule)
                }
                .padding(.horizontal)
                
                ProgressView(value: Double(1), total: Double(numOfQuestions))
                    .tint(.black)
                    .padding(.horizontal)
                
                Spacer()
                
                VStack {
                    Text("How much is?")
                        .font(.title2)
                        .fontWeight(.bold)
                        
                    Text("\(question)")
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
                            Button("\(options[index])") {
                                selectedOption = index
                                processAnswer(answer: options[index])
                            }
                            .answerButtonStyle()
                        }
                    }
                    HStack {
                        ForEach(2...3, id: \.self) { index in
                            Button("\(options[index])") {
                                selectedOption = index
                                processAnswer(answer: options[index])
                            }
                            .answerButtonStyle()
                        }
                    }
                }
                .padding(.horizontal, 20)
                
                Spacer()
                
                Button(action: {
                    if numOfQuestion < numOfQuestions {
                        getNextQuestion()
                    }
                }, label: {
                    Text("Check answer")
                        .foregroundStyle(.white)
                        .fontWeight(.bold)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 10)
                        .background(.gray.opacity(0.6))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                })
                
                Spacer()
            }
            .alert("You must choose an option before continuing", isPresented: $showErrorAlert) {
                Button("OK") { }
            }
            .alert(feedbackAlertTitle, isPresented: $showFeedbackAlert) {
                Button("OK") { }
            }
            .alert(gameOverAlertTitle, isPresented: $showGameOverAlert) {
                Button("OK") { restartGame() }
            }
            .onAppear {
                startGame()
            }
        }
    }
    private func startGame() {
        factorB = Int.random(in: 1...12)
        question = "\(table) X \(factorB)"
        correctAnswer = table * factorB
        generateOptions()
        showErrorAlert = false
        showFeedbackAlert = false
        selectedOption = -1
    }
    private func generateOptions() {
        var options: [Int] = []
        
        options.append(table * factorB)
        
        while(options.count < 4) {
            let option = table * Int.random(in: 1...12)
            if !options.contains(option) {
                options.append(option)
            }
        }
        
        self.options = options
    }
    private func processAnswer(answer: Int) {
        if answer == correctAnswer {
            score += 1
            feedbackAlertTitle = "Correct Answer 🎉"
        } else {
            feedbackAlertTitle = "Sorry, the correct answer was \(correctAnswer) ☺️"
        }
        numOfQuestion += 1
        
        if numOfQuestion > numOfQuestions {
            gameOverAlertTitle = """
            Game Over! 👾
            Final Score: \(score)/\(numOfQuestions)
            """
            showGameOverAlert = true
        }
        
        getNextQuestion()
        showFeedbackAlert = true
    }
    private func getNextQuestion() {
        guard selectedOption != -1 else {
            showErrorAlert = true
            return
        }
        startGame()
    }
    private func restartGame() {
        score = 0
        numOfQuestion = 1
        startGame()
    }
}

#Preview {
    QuizView(table: 10, numOfQuestions: 10)
}
