//
//  ProgressBar.swift
//  tbc-x-hackathon
//
//  Created by Akaki Titberidze on 05.07.24.
//

import SwiftUI

struct ProgressBar: View {
    @Binding var progress: Double
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .frame(width: geometry.size.width , height: geometry.size.height)
                    .opacity(0.3)
                    .foregroundColor(.customMidGray)
                
                Rectangle()
                    .frame(width: CGFloat(progress) * geometry.size.width, height: geometry.size.height)
                    .foregroundColor(.customLightBlue)
            }
            .cornerRadius(45.0)
        }
    }
}
