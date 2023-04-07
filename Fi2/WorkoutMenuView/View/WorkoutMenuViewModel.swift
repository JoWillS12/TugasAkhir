//
//  WorkoutMenuViewModel.swift
//  Fi2
//
//  Created by Joseph William Santoso on 22/03/23.
//

import Foundation
import FirebaseDatabase
import Firebase

class WorkoutMenuViewModel: ObservableObject {
    @Published var savedWorkouts: [SavedWorkout] = []
    let ref = Database.database().reference()

    func addWorkout(savedWorkout: SavedWorkout) {
        savedWorkouts.append(savedWorkout)
        // workoutTitles = savedWorkouts.map { $0.title }
    }

    func fetchData() {
        ref.child("savedWorkouts").observeSingleEvent(of: .value, with: { (snapshot) in
            guard let value = snapshot.value as? [String: Any] else {
                return
            }
            for (_, data) in value {
                guard let savedWorkoutData = data as? [String: Any],
                      let title = savedWorkoutData["title"] as? String,
                      let workoutsData = savedWorkoutData["workouts"] as? [[String: Any]] else {
                    continue
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
                self.addWorkout(savedWorkout: savedWorkout)
            }
        }) { (error) in
            print("Error fetching data: \(error.localizedDescription)")
        }
    }
}


