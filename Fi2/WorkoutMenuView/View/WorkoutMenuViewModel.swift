//
//  WorkoutMenuViewModel.swift
//  Fi2
//
//  Created by Joseph William Santoso on 22/03/23.
//

import Foundation
import FirebaseDatabase

class WorkoutMenuViewModel: ObservableObject {
    @Published var workoutTitles: [String] = []
    
    func addWorkout(title: String) {
        workoutTitles.append(title)
    }
}

