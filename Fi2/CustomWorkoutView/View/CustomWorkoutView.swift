//
//  CustomWorkoutView.swift
//  Fi2
//
//  Created by Joseph William Santoso on 06/03/23.
//

import SwiftUI

struct CustomWorkoutView: View {
    @ObservedObject var custom = CustomWorkoutViewModel()
    @Environment(\.presentationMode) var presentationMode
    @Binding var workoutTitles: [String]
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                VStack {
                    ScrollView {
                        VStack(spacing: 20) {
                            ForEach(Array(custom.workouts.enumerated()), id: \.1.id) { index, workout in
                                if index % 10 == 0 {
                                    Text(custom.getSectionTitle(index: index))
                                        .font(.headline)
                                        .padding(.top, 20)
                                    
                                    Divider()
                                }
                                
                                WorkoutDataView(
                                    workout: workout,
                                    selected: custom.selectedWorkouts.contains(workout),
                                    onSelect: {
                                        if custom.selectedWorkouts.contains(workout) {
                                            custom.selectedWorkouts.remove(workout)
                                        } else {
                                            custom.selectedWorkouts.insert(workout)
                                        }
                                    }
                                )
                                .padding(.bottom, 90)
                            }
                        }
                        .padding(.horizontal, 20)
                        .padding(.bottom, 50)
                    }
                    
                    if !custom.selectedWorkouts.isEmpty {
                        WorkoutEditorView(selectedWorkouts: Array(custom.selectedWorkouts))
                    }
                }
                .navigationBarTitle("Choose Your Workout")
                .navigationBarBackButtonHidden(true)
                .navigationBarItems(
                    leading: Button(action: {
                        // Action to perform when the back button is tapped
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.blue)
                            .font(.title)
                    }
                )
                .edgesIgnoringSafeArea(.bottom)
                .onAppear {
                    custom.listentoRealtimeDatabase()
                }
                .onDisappear {
                    custom.stopListening()
                }
                .onChange(of: custom.savedWorkouts) { savedWorkouts in
                    // Update workoutTitles when a new workout is saved
                    workoutTitles = savedWorkouts.map { $0.title }
                }
            }
        }
    }
}

struct CustomWorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        CustomWorkoutView(workoutTitles: .constant([]))
    }
}
