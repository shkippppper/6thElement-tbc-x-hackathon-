//
//  QuizView.swift
//  tbc-x-hackathon
//
//  Created by Akaki Titberidze on 04.07.24.
//

import SwiftUI

struct QuizView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedAnswer: Int? = nil
    @State private var showCorrectAnswer = false
    @State private var progress = 0.0
    @State private var currentQuestion = 0
    @State private var showCongratulations = false
    @State private var correctAnswersCount = 0
    @ObservedObject var viewModel: MainContentViewModel
    var chapterId: Int
    
    var body: some View {
        VStack {
            ProgressBar(progress: $progress)
                .frame(height: 20)
                .padding(.vertical)
            
            if viewModel.questions.isEmpty {
                Text("Loading questions...")
            } else {
                let question = viewModel.questions[currentQuestion]
                
                if let url = URL(string: viewModel.getFullImagePath(relativePath: question.imagePath)) {
                    AsyncImage(url: url) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(maxWidth: .infinity)
                            .frame(height: 300)
                            .clipShape(RoundedRectangle(cornerRadius: 12.0))
                    } placeholder: {
                        ProgressView()
                            .frame(maxWidth: .infinity)
                            .frame(height: 300)
                            .background(Color.gray.opacity(0.1))
                            .clipShape(RoundedRectangle(cornerRadius: 12.0))
                    }
                }
                
                Text(question.description)
                    .font(.custom("VarelaRound-Regular", size: 22))
                
                VStack(spacing: 20) {
                    ForEach(question.answers.indices, id: \.self) { index in
                        AnswerButton(
                            index: index,
                            answer: question.answers[index].description,
                            answerId: question.answers[index].id,
                            selectedAnswer: $selectedAnswer,
                            showCorrectAnswer: $showCorrectAnswer,
                            didSelectCorrectAnswer: {
                                correctAnswersCount += 1
                            }
                        )
                    }
                }
                .padding(.vertical)
                
                Spacer()
                
                if showCorrectAnswer {
                    Button(action: nextQuestion) {
                        Text("Next")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.customLightBlue)
                            .cornerRadius(10)
                    }
                }
            }
        }
        .onAppear {
            viewModel.fetchQuestions(for: chapterId)
        }
        .padding()
        .sheet(isPresented: $showCongratulations) {
            CongratulationsView(
                gotAllCorrect: correctAnswersCount == viewModel.questions.count,
                onDismiss: { gotAllCorrect in
                    if gotAllCorrect {
                        viewModel.completeTask()
                    }
                    presentationMode.wrappedValue.dismiss()
                }
            )
        }
    }
    
    private func nextQuestion() {
        if currentQuestion < viewModel.questions.count - 1 {
            currentQuestion += 1
            progress += 1.0 / Double(viewModel.questions.count)
            selectedAnswer = nil
            showCorrectAnswer = false
        } else {
            showCongratulations = true
        }
        viewModel.resetStates()
    }
}
