//
//  CustomWorkoutViewModel.swift
//  Fi2
//
//  Created by Joseph William Santoso on 19/03/23.
//

import Foundation
import SwiftUI

class CustomWorkoutViewModel: ObservableObject {
    @Published var workouts = [
        CustomWorkout(name: "Chest and front of shoulder stretch ", image: "pushups", reps: "3 sets of 10", duration: "5 minutes"),
        CustomWorkout(name: "Squats", image: "squats", reps: "3 sets of 10", duration: "5 minutes"),
        CustomWorkout(name: "Lunges", image: "lunges", reps: "3 sets of 10", duration: "5 minutes"),
        CustomWorkout(name: "Crunches", image: "crunches", reps: "3 sets of 10", duration: "5 minutes")
    ]
    
    @Published var selectedWorkouts: Set<CustomWorkout> = []
    @Published var workoutTitle = ""
}
