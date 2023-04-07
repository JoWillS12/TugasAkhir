//
//  LoginViewModel.swift
//  Fi2
//
//  Created by Joseph William Santoso on 03/03/23.
//

import SwiftUI
import FirebaseAuth

class LoginViewModel: ObservableObject {
    @Published var isLogin = false
    @Published var email = ""
    @Published var password = ""
    var onSuccess: (() -> Void)?
    
    func loginUser() {
        Auth.auth().signIn(withEmail: email, password: password) { result, err in
            if let err = err {
                print("Failed due to error:", err)
                return
            }
            print("Successfully logged in with ID: \(result?.user.uid ?? "")")
            if let email = result?.user.email {
                UserDefaults.standard.set(email, forKey: "email") // Save email to UserDefaults
            }
            self.onSuccess?()
        }
    }
    
    func createUser() {
        Auth.auth().createUser(withEmail: email, password: password , completion: { result, err in
            if let err = err {
                print("Failed due to error:", err)
                return
            }
            print("Successfully created account with ID: \(result?.user.uid ?? "")")
            self.onSuccess?()
        })
    }
}


