//
//  SocialFeedView.swift
//  BeGreen
//
//  Created by MUQUEET MOHSEN CHOWDHURY on 4/30/23.
//

import SwiftUI
struct Post: Identifiable {
    var id = UUID()
    var username: String
    var profileImage: String
    var content: String
    var likes: Int
    var comments: [Comment]
    var shares: Int
}

struct Comment: Identifiable {
    var id = UUID()
    var username: String
    var content: String
}


import SwiftUI

struct SocialFeedView: View {
    let posts: [Post] = [
        Post(username: "JohnDoe", profileImage: "person.fill", content: "Just completed the Zero Waste Challenge! #sustainability", likes: 50, comments: [Comment(username: "JaneDoe", content: "Congrats! Keep up the good work.")], shares: 10),
        // Add more sample posts
    ]


    var body: some View {
        NavigationView {
            List(posts) { post in
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Image(post.profileImage)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading) {
                            Text(post.username)
                                .font(.headline)
                            Text(post.content)
                                .font(.body)
                        }
                        .padding(.leading)
                    }
                    
                    HStack {
                        Button(action: {
                            // Implement like action
                        }) {
                            HStack {
                                Image(systemName: "heart")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20, height: 20)
                                Text("\(post.likes)")
                            }
                        }
                        
                        Button(action: {
                            // Implement comment action
                        }) {
                            HStack {
                                Image(systemName: "message")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20, height: 20)
                                Text("\(post.comments.count)")
                            }
                        }
                        
                        Button(action: {
                            // Implement share action
                        }) {
                            HStack {
                                Image(systemName: "square.and.arrow.up")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20, height: 20)
                                Text("\(post.shares)")
                            }
                        }
                    }
                    .padding(.top)
                }
                .padding(.vertical)
            }
            .navigationBarTitle("Social Feed")
        }
    }
}

struct SocialFeedView_Previews: PreviewProvider {
    static var previews: some View {
        SocialFeedView()
    }
}


