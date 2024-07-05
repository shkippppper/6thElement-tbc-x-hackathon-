//
//  CustomTabBar.swift
//  tbc-x-hackathon
//
//  Created by Akaki Titberidze on 05.07.24.
//

import SwiftUI

struct CustomTabBar: View {
    @Binding var selectedIndex: Int
    
    var body: some View {
        HStack {
            TabBarItem(index: 0, selectedIndex: $selectedIndex, iconName: "learnIcon", title: "Learn")
            Spacer()
            TabBarItem(index: 1, selectedIndex: $selectedIndex, iconName: "simulateIcon", title: "Simulate")
            Spacer()
            TabBarItem(index: 2, selectedIndex: $selectedIndex, iconName: "marketplaceIcon", title: "Marketplace")
            Spacer()
            TabBarItem(index: 3, selectedIndex: $selectedIndex, iconName: "othersIcon", title: "Others")
        }
        .padding(.horizontal)
        .padding(.top, 10)
        .padding(.bottom, 100)
        .shadow(radius: 5)
        .background(.customBackground)
    }
}
