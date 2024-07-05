//
//  ChapterScrollView.swift
//  tbc-x-hackathon
//
//  Created by Akaki Titberidze on 04.07.24.
//

import SwiftUI


struct ChapterScrollView: View {
    var moduleId: Int
    var chapterTitle: String
    @ObservedObject var viewModel: MainContentViewModel
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 40) {
                ForEach(0..<viewModel.chapters.count, id: \.self) { index in
                    ChapterView(chapterId: viewModel.chapters[index].id, isComplete: viewModel.chapters[index].isComplete, viewModel: viewModel)
                        .offset(x: offset(for: index))
                }
            }
            .padding()
        }
        .navigationTitle(chapterTitle)
        .onAppear {
            viewModel.fetchChapters(for: moduleId)
        }
    }
    
    private func offset(for index: Int) -> CGFloat {
        switch index {
        case 1, 3:
            return -30
        case 2:
            return -60
        default:
            return 0
        }
    }
}

