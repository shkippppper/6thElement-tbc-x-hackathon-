//
//  AuthenticationPrivacyPolicyView.swift
//  tbc-x-hackathon
//
//  Created by Akaki Titberidze on 03.07.24.
//

import SwiftUI

struct AuthenticationPrivacyPolicyView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("By signing in to Duolingo, you agree to our Terms and Privacy Policy.")
                .font(.custom("VarelaRound-Regular", size: 14))
                .foregroundStyle(.customMidGray)
                .multilineTextAlignment(.center)
            
            Text("This site is protected by reCAPTCHA Enterprise and the Google Privacy Policy and Terms of Service apply.")
                .font(.custom("VarelaRound-Regular", size: 14))
                .foregroundStyle(.customMidGray)
                .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    AuthenticationPrivacyPolicyView()
}
