//
//  CustomWorkoutViewModel.swift
//  Fi2
//
//  Created by Joseph William Santoso on 19/03/23.
//

import Foundation
import FirebaseDatabase

final class CustomWorkoutViewModel: ObservableObject {
    @Published var workouts: [CustomWorkout] = []
    @Published var selectedWorkouts: Set<CustomWorkout> = []
    @Published var categories = ["ARMS", "BACK", "CHEST", "LEGS", "WAIST"]
    @Published var title = ""
    @Published var savedWorkouts: [SavedWorkout] = []
    
    private lazy var databasePath: DatabaseReference? = {
        let ref = Database.database().reference().child("exercises")
        return ref
    }()
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    
    @Published var selectedCategoryIndex = 0
    
    var filteredWorkouts: [CustomWorkout] {
        if selectedCategoryIndex == 0 {
            return workouts
        } else {
            let selectedCategory = categories[selectedCategoryIndex - 1]
            return workouts.filter { $0.bodypart == selectedCategory }
        }
    }
    
    func listentoRealtimeDatabase() {
        guard let databasePath = databasePath else {
            return
        }
        databasePath
            .observe(.childAdded) { [weak self] snapshot, prevChildKey in
                guard
                    let self = self,
                    var json = snapshot.value as? [String: Any]
                else {
                    return
                }
                json["id"] = snapshot.key
                do {
                    let workData = try JSONSerialization.data(withJSONObject: json)
                    let work = try self.decoder.decode(CustomWorkout.self, from: workData)
                    self.workouts.append(work)
                } catch {
                    print("an error occurred", error)
                }
            }
    }
    
    func stopListening() {
        databasePath?.removeAllObservers()
    }
    
    func getSectionTitle(index: Int) -> String {
        let sectionNumber = index / 10
        //        let categories = ["ARMS", "LEGS", "BACK", "WAIST", "CHEST"]
        if sectionNumber < categories.count {
            return categories[sectionNumber]
        } else {
            return ""
        }
    }
    
    func save() {
        // Check if title and selectedWorkouts are not empty
        guard !title.isEmpty, !selectedWorkouts.isEmpty else {
            return
        }
        
        // Convert selectedWorkouts to Data using JSONEncoder
        guard let data = try? JSONEncoder().encode(selectedWorkouts) else {
            return
        }
        
        // Create a new SavedWorkout object
        let savedWorkout = SavedWorkout(title: title, workouts: Array(selectedWorkouts))
        
        // Convert savedWorkout to Data using JSONEncoder
        guard let savedWorkoutData = try? JSONEncoder().encode(savedWorkout) else {
            return
        }
        
        // Save the data and title to Firebase
        guard let databasePath = databasePath else {
            return
        }
        
        let workoutData = [
            "title": title,
            "workouts": data.base64EncodedString(),
            "savedWorkout": savedWorkoutData.base64EncodedString()
        ]
        
        databasePath.childByAutoId().setValue(workoutData) { (error, _) in
            if let error = error {
                print("Error saving data: \(error.localizedDescription)")
            } else {
                print("Data saved successfully!")
            }
        }
    }
    
    
    
}
