//
//  ProfileView.swift
//  BeGreen
//
//  Created by MUQUEET MOHSEN CHOWDHURY on 4/30/23.
//

import SwiftUI

struct ProfileView: View {
    let friend: Friend
    
    var body: some View {
        VStack {
            Image(friend.profileImageName)
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .clipShape(Circle())
                .padding(.top, 40)
            
            Text(friend.username)
                .font(.largeTitle)
                .fontWeight(.bold)
            
            VStack(alignment: .leading) {
                Text("Sustainability Achievements:")
                    .font(.headline)
                    .padding(.top)
                
                Text("• Achievement 1")
                Text("• Achievement 2")
                Text("• Achievement 3")
                // Add more achievements here
            }
            .padding()
            
            Spacer()
        }
        .padding()
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(friend: Friend(username: "EcoWarrior", profileImageName: "profile1"))
    }
}

