//
//  TabBarItem.swift
//  tbc-x-hackathon
//
//  Created by Akaki Titberidze on 05.07.24.
//

import SwiftUI

struct TabBarItem: View {
    let index: Int
    @Binding var selectedIndex: Int
    let iconName: String
    let title: String
    
    var body: some View {
        VStack {
            Image(iconName)
                .resizable()
                .frame(width: selectedIndex == index ? 40 : 30, height: selectedIndex == index ? 40 : 30)
                .padding(5)
                .background(selectedIndex == index ? Color.blue.opacity(0.2) : Color.clear)
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(selectedIndex == index ? Color.blue : Color.clear, lineWidth: 2)
                )
            
            Text(title)
                .font(.footnote)
                .foregroundColor(selectedIndex == index ? Color.blue : Color.gray)
        }
        .onTapGesture {
            withAnimation {
                selectedIndex = index
            }
        }
    }
}
