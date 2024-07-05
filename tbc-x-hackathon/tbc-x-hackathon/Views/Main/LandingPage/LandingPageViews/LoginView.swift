//
//  LoginView.swift
//  tbc-x-hackathon
//
//  Created by Akaki Titberidze on 03.07.24.
//
import SwiftUI

struct LoginView: View {
    @Binding var showLoginPage: Bool
    @ObservedObject var viewModel: AuthenticationViewModel
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Log in")
                .font(.custom("VarelaRound-Regular", size: 26))
                .fontWeight(.bold)
                .foregroundColor(.gray)
                .padding(.bottom, 16)
            
            TextField("Email or username", text: $viewModel.email)
                .padding()
                .font(.custom("VarelaRound-Regular", size: 22))
                .background(RoundedRectangle(cornerRadius: 8).strokeBorder(Color.gray, lineWidth: 1))
            
            SecureField("Password", text: $viewModel.password)
                .padding()
                .font(.custom("VarelaRound-Regular", size: 22))
                .background(RoundedRectangle(cornerRadius: 8).strokeBorder(Color.gray, lineWidth: 1))
            
            Button(action: {
                viewModel.login()
            }) {
                Text("LOG IN")
                    .font(.custom("VarelaRound-Regular", size: 18))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(12)
            }
            
            Button(action: {
                withAnimation {
                    showLoginPage = false
                }
            }) {
                Text("SIGN UP")
                    .font(.custom("VarelaRound-Regular", size: 18))
                    .fontWeight(.bold)
                    .foregroundColor(Color.blue)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.gray)
                    )
                    .background(Color.clear)
                    .cornerRadius(12)
            }

            AuthenticationDividerView()
            AuthenticationOtherOptionsView()
            AuthenticationPrivacyPolicyView()
        }
        .padding(16)
    }
}
