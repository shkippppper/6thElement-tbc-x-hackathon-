//
//  AuthenticationDividerView.swift
//  tbc-x-hackathon
//
//  Created by Akaki Titberidze on 03.07.24.
//

import SwiftUI

struct AuthenticationDividerView: View {
    var body: some View {
        HStack {
            VStack {
                Divider()
                    .frame(height: 1)
                    .background(.customMidGray)
            }
            
            Text("OR")
                .foregroundStyle(.customMidGray)
                .font(.custom("VarelaRound-Regular", size: 18))
            
            VStack {
                Divider()
                    .frame(height: 1)
                    .background(.customMidGray)
            }
        }
        .padding(.vertical)
    }
}
