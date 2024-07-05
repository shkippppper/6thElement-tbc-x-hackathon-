//
//  SignUpView.swift
//  tbc-x-hackathon
//
//  Created by Akaki Titberidze on 03.07.24.
//

import SwiftUI

struct SignUpView: View {
    @Binding var showLoginPage: Bool
    @ObservedObject var viewModel: AuthenticationViewModel
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                Text("Create your profile")
                    .font(.custom("VarelaRound-Regular", size: 26))
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                    .padding(.bottom, 16)
                
                TextField("Age", text: $viewModel.age)
                    .keyboardType(.numberPad)
                    .padding()
                    .font(.custom("VarelaRound-Regular", size: 22))
                    .background(RoundedRectangle(cornerRadius: 8).strokeBorder(Color.gray, lineWidth: 1))
                
                TextField("Name (optional)", text: $viewModel.name)
                    .padding()
                    .font(.custom("VarelaRound-Regular", size: 22))
                    .background(RoundedRectangle(cornerRadius: 8).strokeBorder(Color.gray, lineWidth: 1))
                
                TextField("Email", text: $viewModel.email)
                    .keyboardType(.emailAddress)
                    .padding()
                    .font(.custom("VarelaRound-Regular", size: 22))
                    .background(RoundedRectangle(cornerRadius: 8).strokeBorder(Color.gray, lineWidth: 1))
                
                SecureField("Password", text: $viewModel.password)
                    .padding()
                    .font(.custom("VarelaRound-Regular", size: 22))
                    .background(RoundedRectangle(cornerRadius: 8).strokeBorder(Color.gray, lineWidth: 1))
                
                Button(action: {
                    viewModel.signup()
                }) {
                    Text("CREATE ACCOUNT")
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
                        showLoginPage = true
                    }
                }) {
                    Text("LOG IN")
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
}
