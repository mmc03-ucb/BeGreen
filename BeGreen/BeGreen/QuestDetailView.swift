//
//  QuestDetailView.swift
//  BeGreen
//
//  Created by MUQUEET MOHSEN CHOWDHURY on 4/30/23.
//

import SwiftUI

struct QuestDetailView: View {
    let quest: Quest
    @State private var selectedAnswer: Int?
    @State private var completionStatus: Double = 0.0
    
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
            
            ProgressView(value: completionStatus, total: 1.0)
                .progressViewStyle(LinearProgressViewStyle(tint: .green))
                .padding()
            
            // Interactive elements
            if quest is CollaborativeQuest {
                VStack {
                    Text("This is a collaborative quest")
                        .font(.headline)
                        .padding()
                    
                    Text("Team up with your friends to complete this quest!")
                        .font(.subheadline)
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
                }
            } else {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Mini Tasks:")
                        .font(.headline)
                    
                    HStack {
                        Button(action: {
                            completionStatus += 0.1 // Increase completion status
                        }) {
                            Text("Bike to work")
                                .font(.body)
                                .padding(.horizontal)
                                .foregroundColor(.primary)
                        }
                        
                        Spacer()
                        
                        Text("-0.5 kg CO2")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    
                    HStack {
                        Button(action: {
                            completionStatus += 0.2 // Increase completion status
                        }) {
                            Text("Take the bus instead of driving")
                                .font(.body)
                                .padding(.horizontal)
                                .foregroundColor(.primary)
                        }
                        
                        Spacer()
                        
                        Text("-1.2 kg CO2")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    
                    // Add more mini tasks here
                }
                .padding()
                
                Text("Question:")
                    .font(.headline)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("What is the largest contributor to carbon footprint?")
                        .font(.body)
                        .padding(.horizontal)
                    
                    ForEach(0..<4) { index in
                        Button(action: {
                            selectedAnswer = index
                        }) {
                            HStack {
                                Text("Answer \(index + 1)")
                                    .padding()
                                    .background(selectedAnswer == index ? Color.green : Color(.systemGroupedBackground))
                                    .cornerRadius(8)
                                
                                Spacer()
                            }
                        }
                        .foregroundColor(selectedAnswer == index ? .white : .primary)
                    }
                }
                .padding()
                
            }
            
            Spacer()
        }
        .background(Color(.systemGroupedBackground).edgesIgnoringSafeArea(.bottom))
    }
}

struct QuestDetailView_Previews: PreviewProvider {
    static var previews: some View {
        QuestDetailView(quest: Quest(title: "Reduce Carbon Footprint", description: "Take public transportation or bike instead of driving for a week.", iconName: "car.fill", difficulty: "Medium"))
    }
}
