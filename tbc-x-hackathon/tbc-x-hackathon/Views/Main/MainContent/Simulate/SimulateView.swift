//
//  SimulateView.swift
//  tbc-x-hackathon
//
//  Created by Akaki Titberidze on 05.07.24.
//

import SwiftUI

struct SimulateView: View {
    @ObservedObject var viewModel: MainContentViewModel
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(viewModel.getSimulations(), id: \.hashValue) { simulation in
                    NavigationLink(destination: SimulateMockView(imageString: "simulation1")){
                        SimulateCard(image: simulation.image, name: simulation.name)
                    }
                    .padding(16)
                }
            }
            .padding(.bottom, 20)
        }
    }
}

#Preview {
    SimulateView(viewModel: MainContentViewModel())
}
