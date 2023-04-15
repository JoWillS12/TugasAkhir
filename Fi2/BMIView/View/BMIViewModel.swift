//
//  BMIViewModel.swift
//  Fi2
//
//  Created by Joseph William Santoso on 13/03/23.
//

import SwiftUI
import FirebaseDatabase
import FirebaseAuth

class BMIViewModel: ObservableObject {
    
    @Published var height: Double = 0.0
    @Published var weight: Double = 0.0
    @Published var result: Double = 0.0
    @Published var category = ""
    @Published var BMIData: [BMIResult] = []
    
    let databaseRef = Database.database().reference()
    let auth = Auth.auth()
    
    func saveData() {
        guard let user = auth.currentUser else {
            print("User is not authenticated")
            return
        }
        
        let newBMIResult = BMIResult(height: height, weight: weight, result: result)
        let newBMIResultRef = databaseRef.child("users").child(user.uid).child("bmiData").childByAutoId()
        
        newBMIResultRef.setValue(newBMIResult.toDictionary()) { error, _ in
            if let error = error {
                print("Error saving BMI data: \(error.localizedDescription)")
            } else {
                print("Successfully saved BMI data")
            }
        }
    }
    
    func fetch() {
        guard let currentUserID = Auth.auth().currentUser?.uid else {
            print("User is not logged in")
            return
        }
        
        databaseRef.child("users").child(currentUserID).child("bmiData").observe(.value) { [weak self] (snapshot) in
            guard let self = self else { return }
            
            var results: [BMIResult] = []
            
            for child in snapshot.children {
                if let childSnapshot = child as? DataSnapshot,
                   let dict = childSnapshot.value as? [String: Any],
                   let height = dict["height"] as? Double,
                   let weight = dict["weight"] as? Double,
                   let result = dict["result"] as? Double {
                    let bmiResult = BMIResult(id: childSnapshot.key, height: height, weight: weight, result: result)
                    results.append(bmiResult)
                }
            }
            
            self.BMIData = results
        }
    }

    
    
    func bmi(){
        result = round(weight / (height/100 * height/100))
        if result > 0.0 && result < 18.5{
            category = "Underweight"
        }
        if result >= 18.5 && result <= 24.9 {
            category = "Normal"
        }
        if result >= 25.0 && result <= 29.9 {
            category = "Overweight"
        }
        if result >= 30 {
            category = "Obese"
        }
        saveData()
    }
}


