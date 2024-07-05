//
//  SplashScreenView.swift
//  tbc-x-hackathon
//
//  Created by Akaki Titberidze on 04.07.24.
//

import SwiftUI

struct SplashScreenView: View {
    @Binding var showLandingPage: Bool
    
    var body: some View {
        ZStack {
            Image("backgroundImage1")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("The free, fun, and effective way to learn finances!")
                    .font(.custom("VarelaRound-Regular", size: 28))
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.leading)
                    .padding(.top, 120)

                Spacer()
                
                Button(action: {
                    withAnimation {
                        showLandingPage = false
                    }
                }) {
                    Text("GET STARTED")
                        .font(.custom("VarelaRound-Regular", size: 18))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(.customLightBlue)
                        .cornerRadius(10)
                    
                }
                .padding(.bottom, 60)
            }
            .padding(16)
        }
    }
}
