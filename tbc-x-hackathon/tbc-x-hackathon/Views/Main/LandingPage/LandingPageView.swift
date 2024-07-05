//
//  LandingPageView.swift
//  tbc-x-hackathon
//
//  Created by Akaki Titberidze on 04.07.24.
//

import SwiftUI

struct LandingPageView: View {
    @StateObject var viewModel: AuthenticationViewModel
    
    var body: some View {
        ZStack {
            if viewModel.isUserAuthorized {
                NavigationStack {
                    
                    MainContentView(viewModel: MainContentViewModel(), authViewModel: viewModel)
                        .transition(.opacity)
                }
            } else {
                VStack {
                    if viewModel.showLandingPage {
                        SplashScreenView(showLandingPage: $viewModel.showLandingPage)
                            .transition(.opacity)
                    } else {
                        if viewModel.showLoginPage {
                            LoginView(showLoginPage: $viewModel.showLoginPage, viewModel: viewModel)
                                .environmentObject(viewModel)
                                .transition(.opacity)
                        } else {
                            SignUpView(showLoginPage: $viewModel.showLoginPage, viewModel: viewModel)
                                .environmentObject(viewModel)
                                .transition(.opacity)
                                .padding(.top, 60)
                        }
                    }
                }
                .animation(.easeInOut(duration: 0.5), value: viewModel.showLandingPage)
                .animation(.easeInOut(duration: 0.5), value: viewModel.showLoginPage)
            }
        }
        .background(Color.white)
        .edgesIgnoringSafeArea(.all)
    }
}
