//
//  ChallengeView.swift
//  BeGreen
//
//  Created by MUQUEET MOHSEN CHOWDHURY on 4/30/23.
//

import SwiftUI

struct ChallengeView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedChallenge: Challenge?
    
    let challenges: [Challenge] = [
            Challenge(title: "Public Transportation Challenge", description: "Use public transportation for a week.", iconName: "tram.fill", difficulty: "Easy", timeframe: 7),
            Challenge(title: "Zero Waste Challenge", description: "Try to produce no non-recyclable waste for a week.", iconName: "trash.slash.fill", difficulty: "Medium", timeframe: 7),
            Challenge(title: "Vegan Week", description: "Eat vegan meals for a week.", iconName: "leaf.fill", difficulty: "Medium", timeframe: 7),
        ]
    
    var body: some View {
        List(challenges) { challenge in
            HStack {
                VStack(alignment: .leading) {
                    Text(challenge.title)
                        .font(.headline)
                        .fontWeight(.bold)
                    
                    Text(challenge.description)
                        .font(.caption)
                        .foregroundColor(.secondary)
                    
                    Text("Difficulty: \(challenge.difficulty)")
                        .font(.caption2)
                        .foregroundColor(.red)
                    
                    Text("Timeframe: \(challenge.timeframe) days")
                        .font(.caption2)
                        .foregroundColor(.blue)
                }
                Spacer()
                Button(action: {
                    selectedChallenge = challenge
                }) {
                    Text("Select")
                        .foregroundColor(.green)
                }
                .sheet(item: $selectedChallenge) { challenge in
                    ChallengeDetailView(challenge: challenge)
                }
            }
        }
        .navigationBarTitle("Challenges", displayMode: .inline)
        .navigationBarItems(leading:
                                Button(action: {
                                    presentationMode.wrappedValue.dismiss()
                                }) {
                                    Text("Close")
                                        .foregroundColor(.green)
                                })
    }
}


struct ChallengeView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeView()
    }
}
