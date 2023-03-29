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
    @Published var selectedWorkouts = Set<CustomWorkout>()
    @Published var categories = ["ARMS", "BACK", "CHEST", "LEGS", "WAIST"]
    
    private lazy var databasePath: DatabaseReference? = {
        let ref = Database.database().reference().child("exercises")
        return ref
    }()
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
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
}
