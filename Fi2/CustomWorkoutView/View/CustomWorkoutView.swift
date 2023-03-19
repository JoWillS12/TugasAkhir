//
//  CustomWorkoutView.swift
//  Fi2
//
//  Created by Joseph William Santoso on 06/03/23.
//

import SwiftUI

struct CustomWorkoutView: View {
    @StateObject var viewModel = CustomWorkoutViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text("Choose a Workout")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 30)
                
                ScrollView {
                    VStack {
                        ForEach(viewModel.workouts) { workout in
                            Button(action: {
                                if viewModel.selectedWorkouts.contains(workout) {
                                    viewModel.selectedWorkouts.remove(workout)
                                } else {
                                    viewModel.selectedWorkouts.insert(workout)
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
                                .background(viewModel.selectedWorkouts.contains(workout) ? Color.blue.opacity(0.3) : Color.white)
                                .cornerRadius(20)
                                .shadow(radius: 5)
                            })
                        }
                        .padding(.top, 20.0)
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 50)
                }
                
                if !viewModel.selectedWorkouts.isEmpty {
                    WorkoutEditorView(selectedWorkouts: Array(viewModel.selectedWorkouts))
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
