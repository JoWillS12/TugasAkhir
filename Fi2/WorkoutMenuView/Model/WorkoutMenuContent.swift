//
//  WorkoutMenuContent.swift
//  Fi2
//
//  Created by Joseph William Santoso on 31/03/23.
//

import Foundation

struct SavedWorkout {
    var id: UUID?
    var title: String
    let workouts: [CustomWorkout]

    init(id: UUID? = nil, title: String, workouts: [CustomWorkout]) {
        self.id = id
        self.title = title
        self.workouts = workouts
    }

    func toAnyObject() -> Any {
        let workoutArray = workouts.map { $0.toAnyObject() }
        return [
            "title": title,
            "workouts": workoutArray
        ]
    }
}
