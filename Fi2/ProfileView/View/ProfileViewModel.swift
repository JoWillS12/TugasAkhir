//
//  ProfileViewModel.swift
//  Fi2
//
//  Created by Joseph William Santoso on 17/03/23.
//

import SwiftUI
import FirebaseAuth
import FirebaseDatabase
import Combine

class ProfileViewModel: ObservableObject {
    //    @Published var email = ""
    @Published var selectedMenu = "Add Friend"
    @Published var friendCode = ""
    @Published var friendScore = ""
    @Published var menu = ["Add Friend", "Friend List"]
    @Published var friends: [Friend] = []
    @Published var updateScore = 0
    @Published var userName = ""
    
    
    let email = UserDefaults.standard.string(forKey: "email") ?? ""
    var cancellables = Set<AnyCancellable>()
    
    init() {
        // Fetch the user's friend list from the Firebase database
        if let user = Auth.auth().currentUser {
            let uid = user.uid
            let ref = Database.database().reference().child("users").child(uid).child("friends")
            
            ref.queryOrderedByKey().observe(.value) { snapshot in
                var newFriends = [Friend]()
                for child in snapshot.children {
                    if let childSnapshot = child as? DataSnapshot,
                       let data = childSnapshot.value as? [String: Any] {
                        let friend = Friend(id: UUID(), name: data["name"] as? String ?? "", code: data["code"] as? String ?? "", score: data["score"] as? Int ?? 0)
                        newFriends.append(friend)
                    }
                }
                self.friends = newFriends
            }
        }
        
        if let user = Auth.auth().currentUser {
            let uid = user.uid
            let ref = Database.database().reference().child("users").child(uid).child("score")
            
            ref.observe(.value) { snapshot in
                if let value = snapshot.value as? Int {
                    self.updateScore = value
                }
            }
        }
    }
    
    func addFriend() {
        // Fetch the friend's name from the Firebase database using the friend's code
        let ref = Database.database().reference().child("users")
        ref.queryOrdered(byChild: "code").queryEqual(toValue: friendCode).observeSingleEvent(of: .value) { snapshot in
            if let data = snapshot.value as? [String: [String: Any]], let friendData = data.values.first {
                let friend = Friend(id: UUID(), name: friendData["name"] as? String ?? "", code: self.friendCode, score: friendData["score"] as? Int ?? 0)
                self.friends.append(friend)
                
                if let user = Auth.auth().currentUser {
                    // Get the UID of the user
                    let uid = user.uid
                    
                    // Create a reference to the Firebase database
                    let userRef = ref.child(uid)
                    
                    // Append the new friend's data to the `users` node
                    let friendDict = ["name": friend.name, "code": friend.code, "score": friend.score]
                    userRef.child("friends").childByAutoId().setValue(friendDict)
                }
            } else {
                print("Friend not found")
            }
        }
    }
    
    func score() {
        let ref = Database.database().reference()
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let newScore = self.updateScore + 10
        ref.child("users").child(uid).child("score").setValue(newScore) { (error, ref) in
            if let error = error {
                print("Failed to update score: \(error.localizedDescription)")
                return
            }
            
            DispatchQueue.main.async {
                self.updateScore = newScore // update score in UI
            }
        }
    }
    
    func observeUserName() {
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let ref = Database.database().reference().child("users").child(uid).child("name")
        
        ref.observe(.value) { snapshot in
            if let name = snapshot.value as? String {
                DispatchQueue.main.async {
                    self.userName = name
                }
            }
        }
    }
    
    
    
}


