//
//  MainContentView.swift
//  tbc-x-hackathon
//
//  Created by Akaki Titberidze on 04.07.24.
//

import SwiftUI

struct MainContentView: View {
    @State private var selectedIndex: Int = 0
    @ObservedObject var viewModel: MainContentViewModel
    @ObservedObject var authViewModel: AuthenticationViewModel
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                ZStack {
                    switch selectedIndex {
                    case 0:
                        LearnView(viewModel: viewModel)
                    case 1:
                        SimulateView(viewModel: viewModel)
                    case 2:
                        MarketplaceView()
                    case 3:
                        OthersView(logoutAction: {
                            authViewModel.logout()
                        })
                    default:
                        LearnView(viewModel: viewModel)
                    }
                }
                .frame(maxHeight: .infinity)
                .padding(.bottom, 60)
                
                CustomTabBar(selectedIndex: $selectedIndex)
                    .frame(height: 60)
            }
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}
