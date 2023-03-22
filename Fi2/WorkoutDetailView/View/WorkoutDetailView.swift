//
//  WorkoutDetailView.swift
//  Fi2
//
//  Created by Joseph William Santoso on 19/03/23.
//

import SwiftUI

struct WorkoutDetailView: View {
    @StateObject var detail = WorkoutDetailViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Rectangle()
                    .fill(Color.green)
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.35)
                    .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.13)
                    .ignoresSafeArea()
                VStack {
                    Text("Your Workout")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .padding(.top, 70.0)
                    
                    Spacer()
                        .frame(height: geometry.size.height * 0.12)
                    ScrollView {
                        VStack {
                            ForEach(detail.workouts) { workout in
                                    HStack {
                                        Image(workout.image)
                                            .resizable()
                                            .frame(width: geometry.size.width * 0.2, height: geometry.size.width * 0.2)
                                        
                                        Spacer()
                                            .frame(width: geometry.size.width * 0.1)
                                        
                                        VStack(alignment: .leading) {
                                            Text(workout.name)
                                                .font(.headline)
                                            Text(workout.reps)
                                                .font(.subheadline)
                                                .foregroundColor(.gray)
                                            Text(workout.duration)
                                                .font(.subheadline)
                                                .foregroundColor(.gray)
                                        }
                                    }
                                    .padding()
                                    .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.2)
                                    .background(detail.selectedWorkouts.contains(workout) ? Color.blue.opacity(0.3) : Color.white)
                                    .cornerRadius(20)
                                    .shadow(radius: 5)
                            }
                            .padding(.top, 10.0)
                        }
                        .padding(.horizontal, 20)
                        .padding(.bottom, 50)
                    }
                    
                    Button(action:{} , label: {
                        VStack(spacing: 4) {
                            Text("Start Workout")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                        }
                    })
                    .background((Rectangle()
                        .fill(Color.green)
                        .frame(width: geometry.size.width * (0.9), height: geometry.size.height * 0.06)
                        .cornerRadius(25)))
                }
            }
        }
    }
}

struct WorkoutDetailView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutDetailView()
    }
}
