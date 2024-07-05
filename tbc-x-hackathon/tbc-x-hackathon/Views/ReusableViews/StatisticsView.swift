//
//  StatisticsView.swift
//  tbc-x-hackathon
//
//  Created by Akaki Titberidze on 05.07.24.
//

import SwiftUI

struct StatisticsView: View {
    let value: String
    let description: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text(value)
                    .font(.custom("VarelaRound-Regular", size: 22))
                    .fontWeight(.bold)
                Spacer()
            }
            HStack {
                
                Text(description)
                    .font(.custom("VarelaRound-Regular", size: 14))
                    .fontWeight(.light)
                Spacer()
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: 60)
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(.customLightBlue, lineWidth: 1)
        )
    }
}
