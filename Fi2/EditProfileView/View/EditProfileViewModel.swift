//
//  EditProfileViewModel.swift
//  Fi2
//
//  Created by Joseph William Santoso on 18/03/23.
//

import SwiftUI
import FirebaseDatabase
import FirebaseAuth

class EditProfileViewModel: ObservableObject {
    @Published var name = ""
    @Published var age = ""
    @Published var gender = ""
    
    init() {
            // Retrieve the saved data from the database on initialization
            let ref = Database.database().reference()
            let uid = Auth.auth().currentUser?.uid
            ref.child("users").child(uid!).observeSingleEvent(of: .value) { snapshot in
                if let value = snapshot.value as? [String: Any] {
                    self.name = value["name"] as? String ?? ""
                    self.age = value["age"] as? String ?? ""
                    self.gender = value["gender"] as? String ?? ""
                }
            }
        }
    
    func saveChanges() {
        // Save changes to the database
        let ref = Database.database().reference()
        let uid = Auth.auth().currentUser?.uid
        ref.child("users").child(uid!).updateChildValues(["name": name, "age": age, "gender": gender]) { error, ref in
            if let error = error {
                print("Error updating profile: \(error.localizedDescription)")
            } else {
                print("Profile updated successfully")
            }
        }
    }
}

