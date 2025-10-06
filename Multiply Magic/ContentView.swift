//
//  ContentView.swift
//  Multiply Magic
//
//  Created by carlosgalvankamey on 9/29/25.
//

import SwiftUI

struct CircularButtonStyle: ViewModifier {
    let backgroundColor: Color
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
    func circularButtonStyle(backgroundColor: Color) -> some View {
        self.modifier(CircularButtonStyle(backgroundColor: backgroundColor))
    }
}

struct ContentView: View {
    private let primaryColor = Color(red: 0.94, green: 0.45, blue: 0.20)
    @State private var selectedTable = -1
    @State private var desirableNumOfQuestions = -1
    @State private var selectedNumOfQuestionsButton = -1
    @State private var canNavigate = false
    @State private var showAlert = false
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
                .ignoresSafeArea()
                
                VStack (spacing: 80) {
                    Text("Multiply Magic 🧮")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .fontWeight(.bold)
                        .frame(width: 300, height: 70)
                        .background(Color(red: 0.94, green: 0.45, blue: 0.20))
                        .cornerRadius(20)
                    
                    Spacer()
                    
                    VStack {
                        Text("Which tables do you want to practice?")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundStyle(Color(red: 0.2, green: 0.2, blue: 0.35))
                        
                        VStack (spacing: 10){
                            HStack {
                                ForEach(1...6, id: \.self) { table in
                                    Button("\(table)") {
                                        selectedTable = table
                                    }
                                    .circularButtonStyle(backgroundColor: table == selectedTable ? .gray : primaryColor)
                                }
                            }
                            HStack {
                                ForEach(7...12, id: \.self) { table in
                                    Button("\(table)") {
                                        selectedTable = table
                                    }
                                    .circularButtonStyle(backgroundColor: table == selectedTable ? .gray : primaryColor)
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
                                    selectedNumOfQuestionsButton = option
                                    desirableNumOfQuestions = option * 5
                                }
                                .circularButtonStyle(backgroundColor: option == selectedNumOfQuestionsButton ? .gray : primaryColor)
                            }
                        }
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        if selectedTable == -1 && desirableNumOfQuestions == -1 {
                            showAlert = true
                        } else {
                            canNavigate = true
                        }
                    }, label: {
                        Text("Start Quiz →")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.horizontal, 40)
                            .padding(.vertical, 16)
                            .background(Color(red: 0.94, green: 0.45, blue: 0.20))
                            .foregroundStyle(.white)
                            .clipShape(.capsule)
                    })
                }
                NavigationLink(
                    destination: QuizView(table: selectedTable, numOfQuestions: desirableNumOfQuestions),
                    isActive: $canNavigate
                ) {
                    EmptyView()
                }
            }
            .alert("Please select a table and number of questions before starting.", isPresented: $showAlert) {
                Button("OK", role: .cancel) {}
            }
            .onAppear {
                selectedTable = -1
                selectedNumOfQuestionsButton = -1
                desirableNumOfQuestions = -1
                canNavigate = false
                showAlert = false
            }
        }
    }
}

#Preview {
    ContentView()
}
