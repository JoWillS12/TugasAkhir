//
//  WorkoutMenuVIew.swift
//  Fi2
//
//  Created by Joseph William Santoso on 06/03/23.
//

import SwiftUI

struct WorkoutMenuView: View {
    
    let sub = ["Workout Suggestions for below 18.5 BMI", "Workout Suggestions for below 24.9 BMI", "Workout Suggestions for above 30 BMI"]
    
    var body: some View {
        GeometryReader{ geometry in
            ZStack{
                Rectangle()
                    .fill(Color.green)
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.35)
                    .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.13)
                    .ignoresSafeArea()
                VStack{
                    Spacer()
                        .frame(height: geometry.size.height * 0.07)
                    Text("Get Fit")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                    Button(action: {
                        // Action to perform when the button is tapped
                    }) {
                        Text("Add Custom Workout")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.all, 4.0)
                            .overlay(
                                RoundedRectangle(cornerRadius: 4)
                                    .stroke(Color.white, lineWidth: 2)
                            )
                    }
                    Spacer()
                        .frame(height: geometry.size.height * 0.07)
                    
                    ScrollView {
                        VStack(spacing: geometry.size.height * 0.023) {
                            ForEach(sub.indices, id: \.self) { index in
                                VStack(spacing: 0) {
                                    Text("WORKOUT #\(index + 1)")
                                        .font(.title)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                    Spacer()
                                        .frame(height: geometry.size.height * 0.035)
                                    Text("\(sub[index])")
                                        .font(.headline)
                                        .foregroundColor(.white)
                                        .padding(.bottom)
                                }
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.gray)
                                .cornerRadius(15.0)
                            }
                        }
                        .padding(.horizontal)
                        
                        Divider()
                            .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.004)
                            .overlay(Color.black)
                    }
                    
                }
            }
        }
    }
}

struct WorkoutMenuVIew_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutMenuView()
    }
}
