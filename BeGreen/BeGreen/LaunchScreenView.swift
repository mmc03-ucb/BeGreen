//
//  LaunchScreenView.swift
//  BeGreen
//
//  Created by MUQUEET MOHSEN CHOWDHURY on 4/30/23.
//

import SwiftUI
extension Color {
    static let bottleGreen = Color(red: 0/255, green: 106/255, blue: 78/255)
}
struct LaunchScreenView: View {
    var body: some View {
        ZStack {
            Color.bottleGreen
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Image("AppLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                
                Text("BeGreen")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text("Embrace a sustainable lifestyle")
                    .font(.headline)
                    .foregroundColor(.white)
            }
        }
    }
}

struct LaunchScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreenView()
    }
}

