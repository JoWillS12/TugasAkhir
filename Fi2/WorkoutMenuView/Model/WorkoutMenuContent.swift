//
//  WorkoutMenuContent.swift
//  Fi2
//
//  Created by Joseph William Santoso on 31/03/23.
//

import Foundation

struct SavedWorkout: Codable, Equatable {
    var title: String
    var workouts: [CustomWorkout]
}
