//
//  EducationSectionView.swift
//  BeGreen
//
//  Created by MUQUEET MOHSEN CHOWDHURY on 4/30/23.
//

import SwiftUI

struct Article: Identifiable {
    var id = UUID()
    var title: String
    var description: String
    var imageName: String
}

struct EducationSectionView: View {
    let articles: [Article] = [
        Article(title: "Sustainable Living 101", description: "Learn the basics of sustainable living and how to adopt eco-friendly habits.", imageName: "sustainability"),
        Article(title: "The Importance of Reducing Waste", description: "Discover why reducing waste is crucial for our planet's health and how you can help.", imageName: "reduce_waste"),
        // Add more articles here
    ]

    var body: some View {
        NavigationView {
            List(articles) { article in
                HStack {
                    Image(article.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80)
                        .cornerRadius(8)

                    VStack(alignment: .leading) {
                        Text(article.title)
                            .font(.headline)
                            .fontWeight(.bold)

                        Text(article.description)
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
            }
            .navigationTitle("Education")
        }
    }
}

struct EducationSectionView_Previews: PreviewProvider {
    static var previews: some View {
        EducationSectionView()
    }
}
