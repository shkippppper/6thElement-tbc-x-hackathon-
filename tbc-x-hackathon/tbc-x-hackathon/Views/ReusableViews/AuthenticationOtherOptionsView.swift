//
//  AuthenticationOtherOptionsView.swift
//  tbc-x-hackathon
//
//  Created by Akaki Titberidze on 03.07.24.
//

import SwiftUI

struct AuthenticationOtherOptionsView: View {
    var body: some View {
        VStack {
            Button(action: {

            }) {
                HStack {
                    Image("facebookIcon")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .font(.system(size: 20))
                    Text("Facebook")
                        .font(.custom("VarelaRound-Regular", size: 18))
                        .fontWeight(.bold)
                        .tint(.customPrimary)
                }
                .foregroundColor(Color.blue)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.white)
                .cornerRadius(12)
                .shadow(color: .customMidGray, radius: 6, x: 0, y: 6)
            }
            .padding(.bottom, 6)
            
            Button(action: {

            }) {
                HStack {
                    Image("googleIcon")
                        .resizable()
                        .frame(width: 20, height: 20)
                    Text("Google")
                        .font(.custom("VarelaRound-Regular", size: 18))
                        .fontWeight(.bold)
                        .tint(.customPrimary)
                }
                .foregroundColor(Color.blue)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.white)
                .cornerRadius(12)
                .shadow(color: .customMidGray, radius: 6, x: 0, y: 6)
            }
        }
    }
}

#Preview {
    AuthenticationOtherOptionsView()
}
