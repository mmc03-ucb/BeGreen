//
//  ProgressTrackingView.swift
//  BeGreen
//
//  Created by MUQUEET MOHSEN CHOWDHURY on 4/30/23.
//

import SwiftUI

struct ProgressTrackingView: View {
    @State private var carbonEmissionsSaved = 0.7
    @State private var wasteReduced = 0.5
    @State private var waterConserved = 0.3
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 30) {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Carbon Emissions Saved")
                            .font(.headline)
                        
                        GeometryReader { geometry in
                            ZStack(alignment: .leading) {
                                Rectangle()
                                    .foregroundColor(.gray)
                                    .frame(height: 20)
                                    .cornerRadius(8)
                                
                                Rectangle()
                                    .foregroundColor(.green)
                                    .frame(width: min(CGFloat(carbonEmissionsSaved) * geometry.size.width, geometry.size.width), height: 20)
                                    .cornerRadius(8)
                            }
                        }
                        .frame(height: 20)
                        .padding(.horizontal)
                        .background(Color(.systemGroupedBackground))
                        .cornerRadius(8)
                    }
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Waste Reduced")
                            .font(.headline)
                        
                        GeometryReader { geometry in
                            ZStack(alignment: .leading) {
                                Rectangle()
                                    .foregroundColor(.gray)
                                    .frame(height: 20)
                                    .cornerRadius(8)
                                
                                Rectangle()
                                    .foregroundColor(.green)
                                    .frame(width: min(CGFloat(wasteReduced) * geometry.size.width, geometry.size.width), height: 20)
                                    .cornerRadius(8)
                            }
                        }
                        .frame(height: 20)
                        .padding(.horizontal)
                        .background(Color(.systemGroupedBackground))
                        .cornerRadius(8)
                    }
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Water Conserved")
                            .font(.headline)
                        
                        GeometryReader { geometry in
                            ZStack(alignment: .leading) {
                                Rectangle()
                                    .foregroundColor(.gray)
                                    .frame(height: 20)
                                    .cornerRadius(8)
                                
                                Rectangle()
                                    .foregroundColor(.green)
                                    .frame(width: min(CGFloat(waterConserved) * geometry.size.width, geometry.size.width), height: 20)
                                    .cornerRadius(8)
                            }
                        }
                        .frame(height: 20)
                        .padding(.horizontal)
                        .background(Color(.systemGroupedBackground))
                        .cornerRadius(8)
                    }
                    
                    Text("Achievements")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.top)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Pro Recycler")
                            .font(.headline)
                        
                        Text("You've recycled 10 days in a row!")
                            .font(.body)
                    }
                    .padding(.horizontal)
                    
                }
                .padding()
            }
            .background(Color(.systemGroupedBackground).edgesIgnoringSafeArea(.bottom))
            .navigationTitle("Progress")
        }
    }
}



struct ProgressTrackingView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressTrackingView()
    }
}
