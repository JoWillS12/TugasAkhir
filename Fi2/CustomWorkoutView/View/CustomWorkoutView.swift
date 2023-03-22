//
//  CustomWorkoutView.swift
//  Fi2
//
//  Created by Joseph William Santoso on 06/03/23.
//

import SwiftUI

struct CustomWorkoutView: View {
    @ObservedObject var custom = CustomWorkoutViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                VStack {
                    Text("Choose Your Workout")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.top, 30)
                    
                    ScrollView {
                        VStack {
                            ForEach(custom.workouts) { workout in
                                Button(action: {
                                    if custom.selectedWorkouts.contains(workout) {
                                        custom.selectedWorkouts.remove(workout)
                                    } else {
                                        custom.selectedWorkouts.insert(workout)
                                    }
                                }, label: {
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
                                    .background(custom.selectedWorkouts.contains(workout) ? Color.blue.opacity(0.3) : Color.white)
                                    .cornerRadius(20)
                                    .shadow(radius: 5)
                                })
                            }
                            .padding(.top, 20.0)
                        }
                        .padding(.horizontal, 20)
                        .padding(.bottom, 50)
                    }
                    
                    if !custom.selectedWorkouts.isEmpty {
                        WorkoutEditorView(selectedWorkouts: Array(custom.selectedWorkouts))
                    }
                }
            }
        }
    }
}

struct CustomWorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        CustomWorkoutView()
    }
}
