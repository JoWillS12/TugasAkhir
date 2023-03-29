//
//  WorkoutContent.swift
//  Fi2
//
//  Created by Joseph William Santoso on 19/03/23.
//

import Foundation

struct CustomWorkout: Identifiable, Codable, Hashable {
    var id: String
    var name: String
    var image: String
    let reps: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: CustomWorkout, rhs: CustomWorkout) -> Bool {
        return lhs.id == rhs.id
    }
}
