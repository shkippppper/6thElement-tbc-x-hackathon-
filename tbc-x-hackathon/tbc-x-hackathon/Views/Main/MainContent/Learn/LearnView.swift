//
//  LearnView.swift
//  tbc-x-hackathon
//
//  Created by Akaki Titberidze on 04.07.24.
//

import SwiftUI

struct LearnView: View {
    @ObservedObject var viewModel: MainContentViewModel
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 2), spacing: 16) {
                ForEach(viewModel.modules, id: \.id) { module in
                    LearnItemView(
                        viewModel: viewModel,
                        item: LearnItem(
                            imageName: viewModel.getFullImagePath(relativePath: module.imagePath),
                            title: module.name,
                            id: module.id
                        )
                    )
                }
            }
            .padding()
        }
        .onAppear {
            viewModel.fetchModules()
        }
    }
}
