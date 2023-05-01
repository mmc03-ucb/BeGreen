//
//  RewardsView.swift
//  BeGreen
//
//  Created by MUQUEET MOHSEN CHOWDHURY on 4/30/23.
//

import SwiftUI

struct Reward: Identifiable {
    var id = UUID()
    var title: String
    var iconName: String
    var description: String
}

struct RewardsView: View {
    let rewards: [Reward] = [
        Reward(title: "Carbon Cutter", iconName: "leaf.fill", description: "Reduced carbon footprint by taking public transportation or biking."),
        Reward(title: "Waste Warrior", iconName: "trash.fill", description: "Reduced waste by composting and using reusable containers."),
        // Add more rewards here
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 150), spacing: 20)], spacing: 20) {
                    ForEach(rewards) { reward in
                        VStack {
                            Image(systemName: reward.iconName)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 80)
                                .foregroundColor(.green)
                            
                            Text(reward.title)
                                .font(.headline)
                                .fontWeight(.bold)
                            
                            Text(reward.description)
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                        .padding()
                        .background(Color(.systemGroupedBackground))
                        .cornerRadius(12)
                    }
                }
                .padding()
            }
            .background(Color(.systemGroupedBackground).edgesIgnoringSafeArea(.bottom))
            .navigationTitle("Rewards")
        }
    }
}

struct RewardsView_Previews: PreviewProvider {
    static var previews: some View {
        RewardsView()
    }
}
