//
//  WorkoutEditorView.swift
//  Fi2
//
//  Created by Joseph William Santoso on 19/03/23.
//

import SwiftUI

struct WorkoutEditorView: View {
    
    let selectedWorkouts: [CustomWorkout]
    
    @State private var title = ""
    
    var body: some View {
        VStack {
            Text("Workout Editor")
                .font(.title)
                .padding(.top, 30)
            TextField("Title", text: $title)
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .padding(.horizontal, 20)
            
            ForEach(selectedWorkouts) { workout in
                HStack {
                    Text("Name: \(workout.name)")
                    Spacer()
                    Text("Reps: \(workout.reps)")
                }
                .padding(.horizontal, 20)
            }
            
            HStack {
                Spacer()
                Button(action: {}, label: {
                    Text("Save")
                        .foregroundColor(.white)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                        .background(Color.blue)
                        .cornerRadius(10)
                })
                .padding(.horizontal, 20)
            }
            
            Spacer()
        }
    }
}
