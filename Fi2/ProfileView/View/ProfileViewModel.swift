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
                        let friend = Friend(id: UUID(), name: data["name"] as? String ?? "", code: data["code"] as? String ?? "")
                        newFriends.append(friend)
                    }
                }
                self.friends = newFriends
            }
        }
    }
    
    func addFriend() {
        // Fetch the friend's name from the Firebase database using the friend's code
        let ref = Database.database().reference().child("users")
        ref.queryOrdered(byChild: "code").queryEqual(toValue: friendCode).observeSingleEvent(of: .value) { snapshot in
            if let data = snapshot.value as? [String: [String: Any]], let friendData = data.values.first {
                let friend = Friend(id: UUID(), name: friendData["name"] as? String ?? "", code: self.friendCode)
                self.friends.append(friend)
                
                if let user = Auth.auth().currentUser {
                    // Get the UID of the user
                    let uid = user.uid
                    
                    // Create a reference to the Firebase database
                    let userRef = ref.child(uid)
                    
                    // Append the new friend's data to the `users` node
                    let friendDict = ["name": friend.name, "code": friend.code]
                    userRef.child("friends").childByAutoId().setValue(friendDict)
                }
            } else {
                print("Friend not found")
            }
        }
    }
}


