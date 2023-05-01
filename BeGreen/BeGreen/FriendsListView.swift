//
//  FriendsListView.swift
//  BeGreen
//
//  Created by MUQUEET MOHSEN CHOWDHURY on 4/30/23.
//

import SwiftUI

struct Friend: Identifiable {
    var id = UUID()
    var username: String
    var profileImageName: String
}
struct Challenge: Identifiable {
    var id = UUID()
    var title: String
    var description: String
    var iconName: String
    var difficulty: String
    var timeframe: Int
}


struct FriendsListView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var showChallengeView = false
    
    var friends: [String] = ["Friend1", "Friend2", "Friend3"]
    
    var body: some View {
        NavigationView {
            List(friends, id: \.self) { friend in
                HStack {
                    Text(friend)
                    Spacer()
                    Button(action: {
                        showChallengeView = true
                    }) {
                        Text("Challenge")
                            .foregroundColor(.green)
                    }
                    .sheet(isPresented: $showChallengeView) {
                        ChallengeView()
                    }
                }
            }
            .navigationBarTitle("Friends", displayMode: .inline)
            .navigationBarItems(leading:
                                    Button(action: {
                                        presentationMode.wrappedValue.dismiss()
                                    }) {
                                        Text("Close")
                                            .foregroundColor(.green)
                                    })
        }
    }
}

struct FriendsListView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsListView()
    }
}
