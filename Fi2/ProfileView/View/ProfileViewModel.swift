//
//  ProfileViewModel.swift
//  Fi2
//
//  Created by Joseph William Santoso on 17/03/23.
//

import SwiftUI

class ProfileViewModel: ObservableObject {
//    @Published var email = ""
    @Published var selectedMenu = "Add Friend"
    @Published var friendName = ""
    @Published var friendScore = ""
    @Published var menu = ["Add Friend", "Friend List"]
    
    let email = UserDefaults.standard.string(forKey: "email") ?? ""
}


