//
//  ChapterView.swift
//  tbc-x-hackathon
//
//  Created by Akaki Titberidze on 04.07.24.
//

import SwiftUI

struct ChapterView: View {
    var chapterId: Int
    var isComplete: Bool
    @ObservedObject var viewModel: MainContentViewModel

    var body: some View {
        VStack {            
            Button(action: {
                //for quick styling
            }) {
                NavigationLink(destination: QuizView(viewModel: viewModel, chapterId: chapterId)) {
                    ZStack {
                        Ellipse()
                            .fill(isComplete ? .customDarkGreen : .customDarkGray)
                            .frame(width: 100, height: 70)
                            .offset(y: 10)
                        Ellipse()
                            .fill(isComplete ? .green : .customMidGray)
                            .frame(width: 100, height: 70)
                        
                        Image(isComplete ? "completedIcon" : "starIcon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                    }
                }
            }
        }
    }
}
