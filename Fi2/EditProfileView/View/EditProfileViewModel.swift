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

