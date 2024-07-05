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
            LazyVStack {
                ForEach(0..<viewModel.modules.count / 2, id: \.self) { row in
                    HStack(alignment: .top) {
                        ForEach(0..<2, id: \.self) { column in
                            let index = row * 2 + column
                            if index < viewModel.modules.count {
                                let module = viewModel.modules[index]
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
                    }
                }
            }
            .padding()
        }
        .onAppear {
            viewModel.fetchModules()
        }
    }
}
