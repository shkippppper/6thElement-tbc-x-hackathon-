//
//  AnswerButton.swift
//  tbc-x-hackathon
//
//  Created by Akaki Titberidze on 05.07.24.
//

import SwiftUI

struct AnswerButton: View {
    let index: Int
    let answer: String
    let answerId: Int
    @Binding var selectedAnswer: Int?
    @Binding var showCorrectAnswer: Bool
    @State private var isCorrect: Bool = false
    let didSelectCorrectAnswer: () -> Void
    
    var body: some View {
        Button(action: {
            selectedAnswer = index
            NetworkService.shared.checkAnswer(answerId: answerId) { isCorrectResponse, error in // ვიცი რო ეს ვიუმოდელშ უნდა იყოს მარა არარი დრო
                if let isCorrectResponse = isCorrectResponse {
                    isCorrect = isCorrectResponse
                    if isCorrect {
                        didSelectCorrectAnswer()
                    }
                    showCorrectAnswer = true
                }
            }
        }) {
            Text(answer)
                .font(.custom("VarelaRound-Regular", size: 16))
                .foregroundColor(.white)
                .padding(4)
                .frame(maxWidth: .infinity)
                .background(backgroundColor)
                .cornerRadius(10)
        }
        .disabled(showCorrectAnswer)
    }
    
    private var backgroundColor: Color {
        if let selectedAnswer = selectedAnswer {
            if showCorrectAnswer {
                if index == selectedAnswer {
                    return isCorrect ? .green : .red
                } else {
                    return .customMidGray
                }
            } else {
                return .customLightBlue
            }
        } else {
            return .customLightBlue
        }
    }
}
