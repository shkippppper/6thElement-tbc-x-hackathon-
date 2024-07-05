//
//  OthersView.swift
//  tbc-x-hackathon
//
//  Created by Akaki Titberidze on 04.07.24.
//

import SwiftUI

struct OthersView: View {
    var logoutAction: () -> Void
    @State private var showClaim: Bool = true
    
    let items = [
        MarketItem(imageName: "marketplaceIcon", title: "TEGETA Sale 5%"),
        MarketItem(imageName: "learnIcon", title: "Biblusi Sale 15%"),
        MarketItem(imageName: "othersIcon", title: "MyHome VIP 2mth"),
        MarketItem(imageName: "simulateIcon", title: "TEGETA Sale 15%")
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                headerView()
                infoView(
                    name: "Giorgi",
                    userName: "IASIKO",
                    joinedDate: "June 2020",
                    following: 0,
                    followers: 0
                )
                .padding(.horizontal, 16)
                statisticsGrid()
                myCollectionView()
            }
            .sheet(isPresented: $showClaim) {
                claimView()
                    .presentationDetents([.fraction(0.4)])
            }
            .padding(.top, 8)
        }
        .background(Color(.systemBackground))
    }
    
    private func headerView() -> some View {
        ZStack(alignment: .top) {
            HStack {
                Spacer()
                Button(action: {
                    logoutAction()
                }) {
                    Text("Log Out")
                        .font(.custom("VarelaRound-Regular", size: 14))
                        .fontWeight(.bold)
                        .foregroundColor(Color.blue)
                        .frame(maxWidth: .infinity)
                        .padding(4)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.gray)
                        )
                        .background(Color.white)
                        .cornerRadius(12)
                }
                .frame(width: 80)
            }
            .padding()

            VStack {
                Spacer()
                Image("userplaceholderImage")
                    .resizable()
                    .frame(maxWidth: 140, maxHeight: 180)
                    .scaledToFit()
                    .padding(.bottom, 16)
            }
        }
        .frame(height: 250)
        .frame(maxWidth: .infinity)
        .background(.customDarkBlue)
    }
    
    private func statisticsGrid() -> some View {
        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
            StatisticsView(value: "1", description: "Day streak")
            StatisticsView(value: "1417", description: "Total XP")
            StatisticsView(value: "Bronze", description: "Current league")
            StatisticsView(value: "0", description: "Top 3 finishes")
        }
        .padding(.horizontal, 16)
    }
    
    private func myCollectionView() -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("My Collection")
                .font(.custom("VarelaRound-Regular", size: 26))
                .fontWeight(.semibold)
            
            LazyVStack {
                ForEach(0..<items.count / 3) { row in
                    HStack {
                        ForEach(0..<3) { column in
                            let index = row * 3 + column
                            MarketItemView(item: items[index])
                        }
                    }
                }
            }
        }
        .padding(.top, 16)
        .padding(.horizontal, 16)
    }
    
    private func infoView(
        name: String,
        userName: String,
        joinedDate: String,
        following: Int,
        followers: Int
    ) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(name)
                .font(.custom("VarelaRound-Regular", size: 16))
                .fontWeight(.semibold)
            
            Text(userName)
                .font(.custom("VarelaRound-Regular", size: 16))
                .fontWeight(.semibold)
            
            Text("Joined \(joinedDate)")
                .font(.custom("VarelaRound-Regular", size: 16))
            
            HStack(spacing: 16) {
                Text("\(following) Following")
                    .font(.custom("VarelaRound-Regular", size: 16))
                    .fontWeight(.semibold)
                    .foregroundStyle(.customLightBlue)
                
                Text("\(followers) Followers")
                    .font(.custom("VarelaRound-Regular", size: 16))
                    .fontWeight(.semibold)
                    .foregroundStyle(.customLightBlue)
            }
            
            Divider()
                .background(Color.customDarkGray)
            
            Text("Statistics")
                .font(.custom("VarelaRound-Regular", size: 26))
                .fontWeight(.semibold)
                .onTapGesture {
                    showClaim = true
                    }
        }
    }
    
    private func claimView() -> some View {
        VStack {
            Image("othersIcon")
                .resizable()
                .frame(width: 100, height: 100)
                .scaledToFill()
                .padding(.top, 40)
            
            Text("Biblusi Sale 15%")
                .font(.custom("VarelaRound-Regular", size: 22))
            
            Button(action: {

            }) {
                Text("Claim Your Reward")
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
    }
}
