//
//  MarketplaceView.swift
//  tbc-x-hackathon
//
//  Created by Akaki Titberidze on 04.07.24.
//

import SwiftUI

struct MarketplaceView: View {    
    @ObservedObject var viewModel: MainContentViewModel
    @State var showBuy = false
    @State var selectedItem: MarketItem = MarketItem(imageName: "othersIcon", title: "Biblusi Sale 15%")
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text(String(describing: viewModel.getCurrentMoney()))
                    .font(.custom("VarelaRound-Regular", size: 22))
                    .foregroundStyle(.customLightBlue)
                Image("coinIcon")

            }

            ScrollView {
                LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3), spacing: 16) {
                    ForEach(viewModel.getMarketPlaceItems(), id: \.hashValue) { item in
                        MarketItemView(item: item, showPrice: true, buttonClicked: {
                            selectedItem = item
                            showBuy = true
                        })
                    }
                }
                .padding()
            }
            
            .sheet(isPresented: $showBuy) {
                VStack {
                    Image(selectedItem.imageName)
                        .resizable()
                        .frame(width: 100, height: 100)
                        .scaledToFill()
                        .padding(.top, 40)
                    
                    Text(selectedItem.title)
                        .font(.custom("VarelaRound-Regular", size: 22))
                    
                    HStack {
                        Image("coinIcon")

                        Text("10")
                            .font(.custom("VarelaRound-Regular", size: 16))
                            .foregroundColor(.primary)
                    }
                    
                    Button(action: {
                        if viewModel.purchaseItem(itemPrice: 10) {
                            showBuy = false
                        }
                    }) {
                        Text("Buy")
                            .font(.custom("VarelaRound-Regular", size: 18))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(maxWidth: 200)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(12)
                    }
                    Spacer()
                }
                .shadow(radius: 10)
                    .presentationDetents([.fraction(0.4)])
            }
            .padding(.top, 8)
        }
    }
}
