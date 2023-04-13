//
//  WorkoutMenuViewModel.swift
//  Fi2
//
//  Created by Joseph William Santoso on 22/03/23.
//

import Foundation
import FirebaseDatabase
import Firebase
import FirebaseAuth

class WorkoutMenuViewModel: ObservableObject {
    @Published var savedWorkouts: [SavedWorkout] = []
    let ref = Database.database().reference()
    @Published var userId: String = ""
    
    func addWorkout(savedWorkout: SavedWorkout) {
        savedWorkouts.append(savedWorkout)
        // workoutTitles = savedWorkouts.map { $0.title }
    }
    
    func fetchDataForUser(userId: String) {
        guard !userId.isEmpty else {
            print("Empty userId. Data may not be fetched correctly.")
            return
        }
        if !userId.isEmpty {
            ref.child("savedWorkouts").child(userId).observeSingleEvent(of: .value, with: { (snapshot) in
                guard let value = snapshot.value as? [String: Any],
                      let title = value["title"] as? String,
                      let workoutsData = value["workouts"] as? [[String: Any]] else {
                    return
                }
                var workouts: [CustomWorkout] = []
                for workoutData in workoutsData {
                    guard let id = workoutData["id"] as? String,
                          let name = workoutData["name"] as? String,
                          let bodypart = workoutData["bodypart"] as? String,
                          let image = workoutData["image"] as? String,
                          let reps = workoutData["reps"] as? String else {
                        continue
                    }
                    let workout = CustomWorkout(id: id, name: name, bodypart: bodypart, image: image, reps: reps)
                    workouts.append(workout)
                }
                let savedWorkout = SavedWorkout(title: title, workouts: workouts)
                DispatchQueue.main.async {
                    self.savedWorkouts.append(savedWorkout)
                }
            }) { (error) in
                print("Error fetching data: \(error.localizedDescription)")
            }
        }
    }
    
}


