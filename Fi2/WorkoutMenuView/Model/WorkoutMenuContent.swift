//
//  WorkoutMenuContent.swift
//  Fi2
//
//  Created by Joseph William Santoso on 31/03/23.
//

import Foundation
import Firebase

struct SavedWorkout: Identifiable {
    let id = UUID()
    var title: String
    let workouts: [CustomWorkout]

    func toAnyObject() -> Any {
        let workoutArray = workouts.map { $0.toAnyObject() }
        return [
            "title": title,
            "workouts": workoutArray
        ]
    }
}
