//
//  LeaderboardView.swift
//  BeGreen
//
//  Created by MUQUEET MOHSEN CHOWDHURY on 4/30/23.
//

import SwiftUI

struct LeaderboardView: View {
    let challenge: Challenge
    let friendsProgress: [String: Int] = ["Friend1": 70, "Friend2": 50, "Friend3": 30]
    
    var body: some View {
        VStack {
            Text("Leaderboard for \(challenge.title)")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom)
            
            List(friendsProgress.sorted(by: { $0.value > $1.value }), id: \.key) { friend, progress in
                HStack {
                    Text(friend)
                    Spacer()
                    Text("\(progress)%")
                }
            }
        }
        .padding()
    }
}


struct LeaderboardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderboardView(challenge: Challenge(title: "Sample Challenge", description: "This is a sample challenge.", iconName: "bolt.fill", difficulty: "Easy", timeframe: 7))
    }
}

