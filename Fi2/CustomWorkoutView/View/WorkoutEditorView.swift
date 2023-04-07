//
//  WorkoutEditorView.swift
//  Fi2
//
//  Created by Joseph William Santoso on 19/03/23.
//

import SwiftUI

struct WorkoutEditorView: View {
    
    let selectedWorkouts: [CustomWorkout]
    @ObservedObject var custom = CustomWorkoutViewModel()
    let onSave: (String) -> Void
    @State private var workoutTitle: String = ""
    
    var body: some View {
        VStack {
            Text("Workout Editor")
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, 30)
            TextField("Title", text: $custom.title)
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .padding(.horizontal, 20)
            
            HStack {
                Spacer()
                    .frame(width: 20)
                Button(action: {
                    onSave(custom.title)
                }, label: {
                    Text("Save")
                        .foregroundColor(.white)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                        .background(Color.blue)
                        .cornerRadius(10)
                })
                .padding(.horizontal, 20)
                // Add a NavigationLink inside the button's action closure
                NavigationLink(destination: WorkoutMenuView()) {
                    EmptyView()
                }
                .hidden()
            }

            ScrollView{
                
                ForEach(selectedWorkouts) { workout in
                    HStack {
                        Text("Name: \(workout.name)")
                        Spacer()
                        Text("Reps: \(workout.reps)")
                    }
                    .padding(.horizontal, 20)
                }
            }
            
            
            Spacer()
        }
    }
}
