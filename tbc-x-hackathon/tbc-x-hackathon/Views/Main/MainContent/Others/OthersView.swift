//
//  OthersView.swift
//  tbc-x-hackathon
//
//  Created by Akaki Titberidze on 04.07.24.
//

import SwiftUI

struct OthersView: View {
    var logoutAction: () -> Void
    @State private var showClaim: Bool = false
    @State var selectedItem: MarketItem? = MarketItem(imageName: "nft4", title: "TEGETA Sale 5%")
    
    let items = [
        MarketItem(imageName: "othersIcon", title: "Biblusi Sale 15%"),
        MarketItem(imageName: "nft1", title: "Free Popcorn Cavea"),
        MarketItem(imageName: "nft3", title: "TEGETA Sale 5%"),
        MarketItem(imageName: "nft4", title: "TEGETA Sale 5%")
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
                VStack {
                    Image(selectedItem?.imageName ?? "")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .scaledToFill()
                        .padding(.top, 40)
                    
                    Text(selectedItem?.title ?? "")
                        .font(.custom("VarelaRound-Regular", size: 22))
                    
                    Button(action: {
                        if let url = URL(string: "https://www.youtube.com/watch?v=dQw4w9WgXcQ&ab_channel=RickAstley") {
                            UIApplication.shared.open(url, options: [:], completionHandler: nil)
                        }
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
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3), spacing: 16) {
                ForEach(items, id: \.hashValue) { item in
                    MarketItemView(item: item, showPrice: false, buttonClicked: {
                        selectedItem = item
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            showClaim = true
                        }
                    })
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
}
