//
//  WorkoutContent.swift
//  Fi2
//
//  Created by Joseph William Santoso on 19/03/23.
//

import Foundation

struct CustomWorkout: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let image: String
    let reps: String
    let duration: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func ==(lhs: CustomWorkout, rhs: CustomWorkout) -> Bool {
        return lhs.id == rhs.id
    }
}

