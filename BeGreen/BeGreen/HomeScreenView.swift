//
//  HomeScreenView.swift
//  BeGreen
//
//  Created by MUQUEET MOHSEN CHOWDHURY on 4/30/23.
//

import SwiftUI

struct Quest: Identifiable {
    var id = UUID()
    var title: String
    var description: String
    var iconName: String
    var difficulty: String
}
struct CollaborativeQuest: Identifiable {
    var id = UUID()
    var title: String
    var description: String
    var iconName: String
    var difficulty: String
    var requiredFriends: Int
}
struct HomeScreenView: View {
    let quests: [Quest] = [
        Quest(title: "Reduce Carbon Footprint", description: "Take public transportation or bike instead of driving for a week.", iconName: "car.fill", difficulty: "Medium"),
        Quest(title: "Waste Reduction", description: "Compost food scraps or use reusable containers instead of single-use plastic.", iconName: "trash.fill", difficulty: "Easy"),
        // Add more quests here
    ]
    
    let collaborativeQuests: [CollaborativeQuest] = [
        CollaborativeQuest(title: "Community Clean-up", description: "Organize a community clean-up event to promote cleanliness and sustainability.", iconName: "trash.fill", difficulty: "Hard", requiredFriends: 5),
        CollaborativeQuest(title: "Composting Initiative", description: "Start a composting initiative in your neighborhood to reduce organic waste.", iconName: "leaf.fill", difficulty: "Medium", requiredFriends: 3),
        // Add more collaborative quests here
    ]
    
    @State private var selectedQuest: Quest?
    @State private var selectedCollaborativeQuest: CollaborativeQuest?
    @State private var showRewardsView = false
    @State private var showProgressTrackingView = false
    @State private var showEducationSectionView = false
    @State private var showFriendsListView = false
    @State private var showSocialFeed = false


    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 150), spacing: 20)], spacing: 20) {
                    ForEach(quests) { quest in
                        VStack(alignment: .leading) {
                            Image(systemName: quest.iconName)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 80)
                                .foregroundColor(.bottleGreen)
                            
                            Text(quest.title)
                                .font(.headline)
                                .fontWeight(.bold)
                            
                            Text(quest.description)
                                .font(.caption)
                                .foregroundColor(.secondary)
                            
                            Text("Difficulty: \(quest.difficulty)")
                                .font(.caption2)
                                .foregroundColor(.red)
                            
                            Button(action: {
                                selectedQuest = quest
                            }) {
                                Text("Start Quest")
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 20)
                                    .padding(.vertical, 10)
                                    .background(Color.green)
                                    .cornerRadius(8)
                            }
                            .sheet(item: $selectedQuest) { quest in
                                QuestDetailView(quest: quest)
                            }
                        }
                        .padding()
                        .background(Color(.systemGroupedBackground))
                        .cornerRadius(12)
                    }
                }
                .padding()
                
                Divider()
                    .padding(.horizontal)
                
                ForEach(collaborativeQuests) { quest in
                    VStack(alignment: .leading) {
                        Image(systemName: quest.iconName)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 80)
                            .foregroundColor(.bottleGreen)
                        
                        Text(quest.title)
                            .font(.headline)
                            .fontWeight(.bold)
                        
                        Text(quest.description)
                            .font(.caption)
                            .foregroundColor(.secondary)
                        
                        Text("Difficulty: \(quest.difficulty)")
                            .font(.caption2)
                            .foregroundColor(.red)
                        
                        Text("Requires \(quest.requiredFriends) friends")
                            .font(.caption2)
                            .foregroundColor(.blue)
                        Button(action: {
                            selectedCollaborativeQuest = quest
                        }) {
                            Text("Start Quest")
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .padding(.horizontal, 20)
                                .padding(.vertical, 10)
                                .background(Color.green)
                                .cornerRadius(8)
                        }
                        .sheet(item: $selectedCollaborativeQuest) { quest in
                            CollaborativeQuestDetailView(quest: quest)
                        }
                    }
                    .padding()
                    .background(Color(.systemGroupedBackground))
                    .cornerRadius(12)
                }
            }
            .padding()
            .background(Color(.systemGroupedBackground).edgesIgnoringSafeArea(.bottom))
            .navigationTitle("Quests")
            .navigationBarItems(leading:
                HStack {
                    Button(action: {
                        showFriendsListView = true
                    }) {
                        Image(systemName: "person.2.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 24)
                            .foregroundColor(.green)
                    }
                    .sheet(isPresented: $showFriendsListView) {
                        FriendsListView()
                    }
                    
                    Button(action: {
                        showSocialFeed = true
                    }) {
                        Image(systemName: "bubble.left.and.bubble.right.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 24)
                            .foregroundColor(.green)
                    }
                    .sheet(isPresented: $showSocialFeed) {
                        SocialFeedView()
                    }
                    
                    Button(action: {
                        showProgressTrackingView = true
                    }) {
                        Image(systemName: "chart.bar.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 24)
                            .foregroundColor(.green)
                    }
                    .sheet(isPresented: $showProgressTrackingView) {
                        ProgressTrackingView()
                    }
                    
                    Button(action: {
                        showEducationSectionView = true
                    }) {
                        Image(systemName: "book.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 24)
                            .foregroundColor(.green)
                    }
                    .sheet(isPresented: $showEducationSectionView) {
                        EducationSectionView()
                    }
                },
                trailing:
                Button(action: {
                    showRewardsView = true
                }) {
                    Image(systemName: "gift.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 24)
                        .foregroundColor(.green)
                }
                .sheet(isPresented: $showRewardsView) {
                    RewardsView()
                }
            )
        }
    }
}



struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView()
    }
}
