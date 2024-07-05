//
//  tbc_x_hackathonApp.swift
//  tbc-x-hackathon
//
//  Created by Akaki Titberidze on 03.07.24.
//

import SwiftUI

@main
struct tbc_x_hackathonApp: App {
    var body: some Scene {
        WindowGroup {
            LandingPageView(viewModel: AuthenticationViewModel())
        }
    }
}
