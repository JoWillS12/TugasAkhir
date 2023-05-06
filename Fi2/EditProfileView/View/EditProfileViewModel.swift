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
    @Published var uCode = ""
    @Published var showButton: Bool = true
    @Published var codeGenerated: Bool = false
    @Published var savedName: String = ""
    
    init() {
        // Retrieve the saved data from the database on initialization
        let ref = Database.database().reference()
        let uid = Auth.auth().currentUser?.uid
        ref.child("users").child(uid!).observeSingleEvent(of: .value) { snapshot in
            if let value = snapshot.value as? [String: Any] {
                self.name = value["name"] as? String ?? ""
                self.age = value["age"] as? String ?? ""
                self.gender = value["gender"] as? String ?? ""
                self.uCode = value["code"] as? String ?? ""
                if !self.uCode.isEmpty {
                    self.showButton = false
                }
            }
        }
    }
    
    func saveChanges() {
        // Save changes to the database
        let ref = Database.database().reference()
        let uid = Auth.auth().currentUser?.uid
        let updateName = self.name
        ref.child("users").child(uid!).updateChildValues(["name": name, "age": age, "gender": gender, "code": uCode]) { error, ref in
            if let error = error {
                print("Error updating profile: \(error.localizedDescription)")
            } else {
                print("Profile updated successfully")
            }
            DispatchQueue.main.async {
                self.savedName = updateName // update score in UI
            }
        }
    }
    
    func generateUniqueCode() -> String {
        // Generate a 6-digit random number
        let randomCode = String(format: "%06d", arc4random_uniform(1000000))
        
        // Check if the code already exists in the database (or any other storage)
        let isCodeUnique = checkIfCodeIsUnique(randomCode)
        
        if isCodeUnique {
            self.codeGenerated = true
            self.showButton = false
            return randomCode
        } else {
            // If the code already exists, generate a new one recursively
            return generateUniqueCode()
        }
    }
    
    func checkIfCodeIsUnique(_ code: String) -> Bool {
        // Check if the code already exists in the database (or any other storage)
        // Return true if it's unique, false otherwise
        return true
    }
}


