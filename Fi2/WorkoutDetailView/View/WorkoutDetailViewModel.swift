//
//  WorkoutDetailViewModel.swift
//  Fi2
//
//  Created by Joseph William Santoso on 22/03/23.
//

import SwiftUI

class WorkoutDetailViewModel: ObservableObject {
    @Published var workouts = [
        CustomWorkout(name: "Pushups", image: "pushups", reps: "3 sets of 10", duration: "5 minutes"),
        CustomWorkout(name: "Squats", image: "squats", reps: "3 sets of 10", duration: "5 minutes"),
        CustomWorkout(name: "Lunges", image: "lunges", reps: "3 sets of 10", duration: "5 minutes"),
        CustomWorkout(name: "Crunches", image: "crunches", reps: "3 sets of 10", duration: "5 minutes")
    ]
    
    @Published var selectedWorkouts: Set<CustomWorkout> = []
    @Published var workoutTitle = ""
}
