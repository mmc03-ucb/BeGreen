//
//  CollaborativeQuestDetailView.swift
//  BeGreen
//
//  Created by MUQUEET MOHSEN CHOWDHURY on 4/30/23.
//

//
//  CollaborativeQuestDetailView.swift
//  BeGreen
//
//  Created by MUQUEET MOHSEN CHOWDHURY on 4/30/23.
//

import SwiftUI

struct CollaborativeQuestDetailView: View {
    let quest: CollaborativeQuest
    @State private var progress: Progress = Progress()

    var body: some View {
        VStack {
            Text(quest.title)
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding()
            
            Text(quest.description)
                .font(.body)
                .padding()
            
            // Progress tracker
            Text("Completion Status")
                .font(.headline)
            
            ProgressView()
                .progressViewStyle(LinearProgressViewStyle(tint: .green))
                .padding()

            
            Text("Requires \(quest.requiredFriends) friends")
                .font(.caption2)
                .foregroundColor(.blue)
                .padding()
            
            Button(action: {
                // Handle collaborative quest interaction
            }) {
                Text("Join Collaborative Quest")
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .background(Color.green)
                    .cornerRadius(8)
            }
            .padding()
            
            Spacer()
        }
        .background(Color(.systemGroupedBackground).edgesIgnoringSafeArea(.bottom))
    }
}


struct CollaborativeQuestDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let quest = CollaborativeQuest(title: "Community Clean-up", description: "Organize a community clean-up event to promote cleanliness and sustainability.", iconName: "trash.fill", difficulty: "Hard", requiredFriends: 5)
        return CollaborativeQuestDetailView(quest: quest)
    }
}

