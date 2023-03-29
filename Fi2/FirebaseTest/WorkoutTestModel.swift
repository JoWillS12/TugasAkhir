////
////  WorkoutTestModel.swift
////  Fi2
////
////  Created by Joseph William Santoso on 29/03/23.
////
//
//import Foundation
//import FirebaseDatabase
//
//final class WorkoutTestModel: ObservableObject {
//    @Published var worktest: [WorkoutTest] = []
//    
//    private lazy var databasePath: DatabaseReference? = {
//        let ref = Database.database().reference().child("exercises")
//        return ref
//    }()
//    
//    private let encoder = JSONEncoder()
//    private let decoder = JSONDecoder()
//    
//    func listentoRealtimeDatabase() {
//        guard let databasePath = databasePath else {
//            return
//        }
//        databasePath
//            .observe(.childAdded) { [weak self] snapshot, prevChildKey in
//                guard
//                    let self = self,
//                    var json = snapshot.value as? [String: Any]
//                else {
//                    return
//                }
//                json["id"] = snapshot.key
//                do {
//                    let workData = try JSONSerialization.data(withJSONObject: json)
//                    let work = try self.decoder.decode(WorkoutTest.self, from: workData)
//                    self.worktest.append(work)
//                } catch {
//                    print("an error occurred", error)
//                }
//            }
//    }
//    
//    func stopListening() {
//        databasePath?.removeAllObservers()
//    }
//}
