//
//  MarketplaceView.swift
//  tbc-x-hackathon
//
//  Created by Akaki Titberidze on 04.07.24.
//

import SwiftUI

struct MarketplaceView: View {
    let items = [
        MarketItem(imageName: "marketplaceIcon", title: "TEGETA Sale 5%"),
        MarketItem(imageName: "learnIcon", title: "Biblusi Book"),
        MarketItem(imageName: "othersIcon", title: "MyAuto VIP 1mth"),
        MarketItem(imageName: "simulateIcon", title: "MyHome VIP 1mth"),
        MarketItem(imageName: "marketplaceIcon", title: "TEGETA Sale 5%"),
        MarketItem(imageName: "learnIcon", title: "MyHome VIP 2mth"),
        MarketItem(imageName: "othersIcon", title: "TEGETA Sale 25%"),
        MarketItem(imageName: "simulateIcon", title: "Biblusi 2 Book"),
        MarketItem(imageName: "marketplaceIcon", title: "TEGETA Sale 5%"),
        MarketItem(imageName: "learnIcon", title: "Biblusi Book"),
        MarketItem(imageName: "othersIcon", title: "MyHome VIP 2mth"),
        MarketItem(imageName: "simulateIcon", title: "TEGETA Sale 15%")
    ]
    
    var body: some View {
        VStack {
            
            ScrollView {
                LazyVStack {
                    ForEach(0..<items.count / 3, id: \.self) { row in
                        HStack(alignment: .top) {
                            ForEach(0..<3, id: \.self) { column in
                                if let item = itemAt(row: row, column: column) {
                                    MarketItemView(item: item)
                                }
                            }
                        }
                    }
                }
                .padding()
            }
        }
    }
    
    private func itemAt(row: Int, column: Int) -> MarketItem? {
        let index = row * 3 + column
        return index < items.count ? items[index] : nil
    }
}
