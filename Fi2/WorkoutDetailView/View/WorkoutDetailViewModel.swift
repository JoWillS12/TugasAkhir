//
//  WorkoutDetailViewModel.swift
//  Fi2
//
//  Created by Joseph William Santoso on 22/03/23.
//

import Foundation

class WorkoutDetailViewModel: ObservableObject {
    @Published var savedWorkout: SavedWorkout
    
    init(savedWorkout: SavedWorkout) {
        self.savedWorkout = savedWorkout
    }
}

