//
//  SimulateMockView.swift
//  tbc-x-hackathon
//
//  Created by Akaki Titberidze on 05.07.24.
//

import SwiftUI

struct SimulateMockView: View {
    let imageString: String
    
    var body: some View {
        ZStack {
            Image(imageString)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .ignoresSafeArea(.all)

    }
}
