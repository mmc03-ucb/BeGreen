//
//  ChallengeDetailView.swift
//  BeGreen
//
//  Created by MUQUEET MOHSEN CHOWDHURY on 4/30/23.
//

import SwiftUI

struct ChallengeDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var showLeaderboard = false
    let challenge: Challenge
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(challenge.title)
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom)
            
            Text(challenge.description)
                .font(.body)
                .padding(.bottom)
            
            Text("Difficulty: \(challenge.difficulty)")                .font(.caption)
                .foregroundColor(.red)
                .padding(.bottom)
            
            Text("Timeframe: \(challenge.timeframe) days")
                .font(.caption)
                .foregroundColor(.blue)
            
            Button(action: {
                showLeaderboard = true
            }) {
                Text("View Leaderboard")
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .background(Color.green)
                    .cornerRadius(8)
            }
            .sheet(isPresented: $showLeaderboard) {
                LeaderboardView(challenge: challenge)
            }
            
            Spacer()
        }
        .padding()
        .navigationBarTitle("Challenge Details", displayMode: .inline)
        .navigationBarItems(leading:
                                Button(action: {
                                    presentationMode.wrappedValue.dismiss()
                                }) {
                                    Text("Close")
                                        .foregroundColor(.green)
                                })
    }
}


struct ChallengeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeDetailView(challenge: Challenge(title: "Sample Challenge", description: "This is a sample challenge.", iconName: "bolt.fill", difficulty: "Easy", timeframe: 7))
    }
}


