//
//  CustomWorkoutViewModel.swift
//  Fi2
//
//  Created by Joseph William Santoso on 19/03/23.
//

import Foundation
import FirebaseDatabase
import FirebaseAuth

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
    let databaseRef = Database.database().reference()
    
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
        if sectionNumber < categories.count {
            let category = categories[sectionNumber]
            if let filteredCategory = filteredWorkouts.first(where: { $0.bodypart == category }) {
                return filteredCategory.bodypart
            } else {
                return ""
            }
        } else {
            return ""
        }
    }
    
    
    func saveWorkoutToDatabase(_ title: String, _ workouts: [CustomWorkout]) {
        if let userId = Auth.auth().currentUser?.uid {
            let ref = Database.database().reference(withPath: "savedWorkouts/\(userId)/\(UUID().uuidString)")
            let savedWorkout = SavedWorkout(title: title, workouts: workouts)
            ref.setValue(savedWorkout.toAnyObject())
        }
    }
    
    
}
